import 'package:cerberus_ui/app/router.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/features/preferences/ui/settings_button.dart';
import 'package:cerberus_ui/features/preferences/ui/settings_screen.dart';
import 'package:cerberus_ui/shared/widgets/not_available_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/pump_app.dart';

void main() {
  group('SettingsButton', () {
    testWidgets('Given a signed-in user where the guard puts them while the '
        'protocol gate is closed '
        'When settings are chosen '
        'Then the settings screen opens on top, and going back returns to '
        'where they were (step 1)', (tester) async {
      final container = await pumpCerberusApp(tester);
      await container
          .read(sessionProvider.notifier)
          .establish(token: 'token', accountId: 'acct-1');
      await tester.pumpAndSettle();
      expect(find.byType(NotAvailableScreen), findsOneWidget);

      await tester.tap(find.byKey(SettingsButton.button));
      await tester.pumpAndSettle();

      expect(find.byType(SettingsScreen), findsOneWidget);
      // Pushed on top: the base location stays, and settings is the last
      // match.
      expect(
        container
            .read(routerProvider)
            .routerDelegate
            .currentConfiguration
            .last
            .matchedLocation,
        Routes.settings,
      );

      await tester.tap(find.byType(BackButton));
      await tester.pumpAndSettle();

      expect(find.byType(NotAvailableScreen), findsOneWidget);
    });

    testWidgets('Given no session '
        'When settings are requested by address '
        'Then the guard sends the user to sign-in, remembering them '
        '(UC-07)', (tester) async {
      final container = await pumpCerberusApp(tester);

      container.read(routerProvider).go(Routes.settings);
      await tester.pumpAndSettle();

      expect(find.byType(SettingsScreen), findsNothing);
      expect(
        container
            .read(routerProvider)
            .routerDelegate
            .currentConfiguration
            .uri
            .toString(),
        Routes.carrying(Routes.signIn, Routes.settings),
      );
    });
  });
}
