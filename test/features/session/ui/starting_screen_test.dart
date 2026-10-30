import 'dart:async';

import 'package:cerberus_ui/app/router.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';
import 'package:cerberus_ui/features/session/ui/sign_in_screen.dart';
import 'package:cerberus_ui/features/session/ui/starting_screen.dart';
import 'package:cerberus_ui/shared/widgets/not_available_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/fake_session_repository.dart';
import '../../../support/pump_app.dart';
import '../../../support/recording_stores.dart';

String _location(ProviderContainer container) => container
    .read(routerProvider)
    .routerDelegate
    .currentConfiguration
    .uri
    .toString();

/// Starts the application with a stored token, verifying it through
/// [repository].
Future<ProviderContainer> _start(
  WidgetTester tester,
  FakeSessionRepository repository, {
  bool settle = true,
}) {
  final secureStore = RecordingSecureStore()
    ..values[SecureKey.sessionToken] = 'stored-token';
  return pumpCerberusApp(
    tester,
    secureStore: secureStore,
    restoreSession: true,
    settle: settle,
    overrides: [sessionRepositoryProvider.overrideWithValue(repository)],
  );
}

void main() {
  group('StartingScreen', () {
    testWidgets('Given a stored session being verified '
        'When the application starts '
        'Then a neutral starting screen is shown — no vault, no account '
        'detail, no sign-in (UC-05 step 2)', (tester) async {
      final repository = FakeSessionRepository()
        ..pendingVerification = Completer();
      final container = await _start(tester, repository, settle: false);

      expect(_location(container), Routes.starting);
      expect(find.byKey(StartingScreen.progress), findsOneWidget);
      expect(find.text('Checking your session…'), findsOneWidget);
      expect(find.byType(SignInScreen), findsNothing);
      expect(find.byType(NotAvailableScreen), findsNothing);

      repository.pendingVerification!.complete(
        const Success(SessionVerification.protectionFound),
      );
      await tester.pumpAndSettle();
    });

    testWidgets('Given a stored session the API accepts '
        'When the verification completes '
        'Then the guard takes the user on toward unlock, which the closed '
        'protocol gate refuses (UC-05 steps 5–6, FR-CR-02)', (tester) async {
      final repository = FakeSessionRepository()
        ..pendingVerification = Completer();
      final container = await _start(tester, repository, settle: false);

      repository.pendingVerification!.complete(
        const Success(SessionVerification.protectionFound),
      );
      await tester.pumpAndSettle();

      expect(container.read(sessionProvider), const SignedIn(accountId: null));
      expect(
        _location(container),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      expect(find.byType(NotAvailableScreen), findsOneWidget);
    });

    testWidgets('Given a deep link requested while the session is verified '
        'When the verification completes '
        'Then the guard takes the user to the route the link asked for '
        '(UC-05 step 6)', (tester) async {
      final repository = FakeSessionRepository()
        ..pendingVerification = Completer();
      final container = await _start(tester, repository, settle: false);

      container.read(routerProvider).go(Routes.accountSettings);
      await tester.pump();
      expect(
        _location(container),
        Routes.startingFor(Uri.parse(Routes.accountSettings)),
      );

      repository.pendingVerification!.complete(
        const Success(SessionVerification.protectionNotFound),
      );
      await tester.pumpAndSettle();

      expect(_location(container), Routes.accountSettings);
    });

    testWidgets('Given an unreachable instance '
        'When the stored session is verified '
        'Then a lost connection is shown with a retry, and no vault screen '
        '(UC-05 AF-04)', (tester) async {
      final repository = FakeSessionRepository()
        ..nextVerification = const Failure(
          message: 'The instance could not be reached.',
          kind: FailureKind.unreachable,
        );
      final container = await _start(tester, repository);

      expect(Uri.parse(_location(container)).path, Routes.starting);
      expect(find.text('Connection lost'), findsOneWidget);
      expect(find.byKey(StartingScreen.failureMessage), findsOneWidget);
      expect(find.text('The instance could not be reached.'), findsOneWidget);
      expect(find.byKey(StartingScreen.retryButton), findsOneWidget);
      expect(find.byType(NotAvailableScreen), findsNothing);
      expect(container.read(sessionProvider), const SignedOut());
    });

    testWidgets('Given a failed verification '
        'When the user retries and the API accepts the token '
        'Then the session is restored and the start released (UC-05 AF-04)', (
      tester,
    ) async {
      final repository = FakeSessionRepository()
        ..nextVerification = const Failure(
          message: 'The instance could not be reached.',
          kind: FailureKind.unreachable,
        );
      final container = await _start(tester, repository);
      repository.nextVerification = const Success(
        SessionVerification.protectionFound,
      );

      await tester.tap(find.byKey(StartingScreen.retryButton));
      await tester.pumpAndSettle();

      expect(repository.verifications, 2);
      expect(container.read(sessionProvider), const SignedIn(accountId: null));
      expect(find.byType(StartingScreen), findsNothing);
    });

    testWidgets('Given the API refuses for a reason of its own '
        'When the stored session is verified '
        'Then exactly that reason is shown with a retry, the session neither '
        'restored nor ended (UC-05 AF-04, FR-DA-06)', (tester) async {
      final repository = FakeSessionRepository()
        ..nextVerification = const Failure(
          message: 'identity_unavailable',
          kind: FailureKind.serverError,
        );
      await _start(tester, repository);

      expect(find.text("Your session couldn't be checked"), findsOneWidget);
      expect(find.text('identity_unavailable'), findsOneWidget);
      expect(find.text('Connection lost'), findsNothing);
      expect(find.byKey(StartingScreen.retryButton), findsOneWidget);
    });
  });
}
