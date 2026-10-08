import 'package:cerberus_ui/l10n/app_localizations.dart';
import 'package:cerberus_ui/shared/widgets/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NotFoundScreen', () {
    testWidgets('Given an address that names nothing '
        'When the screen is shown '
        'Then it says so', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: NotFoundScreen(),
        ),
      );

      expect(find.text('Page not found'), findsOneWidget);
      expect(find.text('There is nothing at this address.'), findsOneWidget);
    });
  });
}
