import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/l10n/app_localizations.dart';
import 'package:cerberus_ui/shared/widgets/not_available_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> _pump(WidgetTester tester, UnavailableReason reason) =>
    tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: NotAvailableScreen(reason: reason),
      ),
    );

void main() {
  group('NotAvailableScreen', () {
    testWidgets('Given the closed protocol gate '
        'When the screen is shown '
        'Then it explains the feature waits for the protocol review '
        '(UC-07 AF-06)', (tester) async {
      await _pump(tester, UnavailableReason.protocol);

      expect(find.text('Not available'), findsOneWidget);
      expect(find.textContaining('security review'), findsOneWidget);
    });

    testWidgets('Given an online-only device '
        'When the screen is shown '
        'Then it says the device keeps no copy', (tester) async {
      await _pump(tester, UnavailableReason.storageMode);

      expect(find.textContaining('online only'), findsOneWidget);
    });

    testWidgets('Given a device restricted to a profile '
        'When the screen is shown '
        'Then it says the content is outside it (UC-07 AF-03)', (tester) async {
      await _pump(tester, UnavailableReason.deviceProfile);

      expect(find.textContaining('restricted to one profile'), findsOneWidget);
    });
  });
}
