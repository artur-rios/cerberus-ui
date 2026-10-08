/// The router and its single redirect (IR-03, FR-DA-09).
///
/// Every route, however reached, passes `resolveRedirect`. The router listens
/// to everything the guard decides by, so a change of session, lock state,
/// device settings, instance or session restore re-evaluates the current
/// route at once — a session ending mid-screen sends the user to sign-in
/// without waiting for them to navigate.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:go_router/go_router.dart';

import '../core/config/device_settings.dart';
import '../core/config/instance_config.dart';
import '../core/crypto/protocol_gate.dart';
import '../core/session/session_controller.dart';
import '../features/session/state/session_restore_controller.dart';
import '../features/session/ui/challenge_screen.dart';
import '../features/session/ui/sign_in_screen.dart';
import '../features/session/ui/sign_out_button.dart';
import '../features/session/ui/starting_screen.dart';
import '../shared/widgets/not_available_screen.dart';
import '../shared/widgets/not_found_screen.dart';
import '../shared/widgets/pending_feature_screen.dart';
import 'route_guard.dart';
import 'routes.dart';

/// The guard's inputs, read from the providers that hold them.
GuardState readGuardState(Ref ref) => GuardState(
  instanceConfigured: ref.read(instanceConfigProvider) != null,
  session: ref.read(sessionProvider),
  vault: ref.read(vaultStateProvider),
  protocolGateOpen: ref.read(protocolGateProvider).isOpen,
  device: ref.read(deviceSettingsProvider),
  startHeld: ref.read(sessionRestoreProvider).holdsStart,
);

/// The application's router.
final routerProvider = Provider<GoRouter>((ref) {
  final refresh = ValueNotifier<int>(0);
  void reevaluateOn<T>(ProviderListenable<T> provider) =>
      ref.listen<T>(provider, (_, _) => refresh.value++);

  reevaluateOn(instanceConfigProvider);
  reevaluateOn(sessionProvider);
  reevaluateOn(vaultStateProvider);
  reevaluateOn(deviceSettingsProvider);
  reevaluateOn(protocolGateProvider);
  reevaluateOn(sessionRestoreProvider);

  final router = GoRouter(
    initialLocation: Routes.home,
    refreshListenable: refresh,
    redirect: (context, state) =>
        resolveRedirect(readGuardState(ref), state.uri),
    errorBuilder: (context, state) => const NotFoundScreen(),
    routes: [
      // Replaced by UC-01.
      GoRoute(
        path: Routes.setup,
        builder: (context, state) => const PendingFeatureScreen(),
      ),
      // Held here while a stored session is verified (UC-05).
      GoRoute(
        path: Routes.starting,
        builder: (context, state) => const StartingScreen(),
      ),
      GoRoute(
        path: Routes.signIn,
        builder: (context, state) => const SignInScreen(),
      ),
      // Reachable only while a challenge is outstanding (FR-SE-04).
      GoRoute(
        path: Routes.challenge,
        builder: (context, state) => const ChallengeScreen(),
      ),
      // Signed in only, and where a signed-in user lands while the protocol
      // gate is closed — so signing out is offered here (UC-06).
      GoRoute(
        path: Routes.unavailable,
        builder: (context, state) => NotAvailableScreen(
          reason: UnavailableReason.fromParameter(
            state.uri.queryParameters[Routes.reasonParameter],
          ),
          actions: const [SignOutButton()],
        ),
      ),
    ],
  );

  ref.onDispose(() {
    router.dispose();
    refresh.dispose();
  });

  return router;
});
