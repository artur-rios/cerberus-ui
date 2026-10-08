import 'package:cerberus_ui/app/router.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/features/session/ui/sign_in_screen.dart';
import 'package:cerberus_ui/shared/widgets/not_available_screen.dart';
import 'package:cerberus_ui/shared/widgets/not_found_screen.dart';
import 'package:cerberus_ui/shared/widgets/pending_feature_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/pump_app.dart';

String _location(ProviderContainer container) => container
    .read(routerProvider)
    .routerDelegate
    .currentConfiguration
    .uri
    .toString();

void main() {
  group('routerProvider', () {
    testWidgets('Given no instance '
        'When the application starts '
        'Then the guard sends it to setup', (tester) async {
      final container = await pumpCerberusApp(tester, instance: '');

      expect(_location(container), Routes.setup);
      expect(find.byType(PendingFeatureScreen), findsOneWidget);
    });

    testWidgets('Given an instance and no session '
        'When the application starts '
        'Then the guard sends it to sign-in', (tester) async {
      final container = await pumpCerberusApp(tester);

      expect(_location(container), Routes.signIn);
      expect(find.byType(SignInScreen), findsOneWidget);
    });

    testWidgets('Given an outstanding second-factor challenge '
        'When the challenge route is requested '
        'Then it is admitted, reserved for UC-04', (tester) async {
      final container = await pumpCerberusApp(tester);
      container
          .read(sessionProvider.notifier)
          .challenge(challengeToken: 'c', methods: ['totp']);

      container.read(routerProvider).go(Routes.challenge);
      await tester.pumpAndSettle();

      expect(_location(container), Routes.challenge);
      expect(find.byType(PendingFeatureScreen), findsOneWidget);
    });

    testWidgets('Given no challenge '
        'When the challenge route is requested '
        'Then the guard sends the visitor to sign-in', (tester) async {
      final container = await pumpCerberusApp(tester);

      container.read(routerProvider).go(Routes.challenge);
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
    });

    testWidgets('Given a session and the closed protocol gate '
        'When the session is established '
        'Then the guard re-evaluates at once and states why the vault is not '
        'available', (tester) async {
      final container = await pumpCerberusApp(tester);

      await container
          .read(sessionProvider.notifier)
          .establish(token: 't', accountId: 'acct-1');
      await tester.pumpAndSettle();

      expect(
        _location(container),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      expect(find.byType(NotAvailableScreen), findsOneWidget);
    });

    testWidgets('Given a session '
        'When it ends mid-screen '
        'Then the guard sends the user to sign-in without waiting for '
        'navigation', (tester) async {
      final container = await pumpCerberusApp(tester);
      await container
          .read(sessionProvider.notifier)
          .establish(token: 't', accountId: 'acct-1');
      await tester.pumpAndSettle();

      await container.read(sessionProvider.notifier).end();
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
    });

    testWidgets('Given a session '
        'When an address no route names is requested '
        'Then the not-found screen is shown, after the guard', (tester) async {
      final container = await pumpCerberusApp(tester);
      await container
          .read(sessionProvider.notifier)
          .establish(token: 't', accountId: 'acct-1');
      await tester.pumpAndSettle();

      container.read(routerProvider).go('/no/such/route');
      await tester.pumpAndSettle();

      expect(find.byType(NotFoundScreen), findsOneWidget);
    });
  });
}
