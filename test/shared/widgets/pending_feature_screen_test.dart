import 'package:cerberus_ui/l10n/app_localizations.dart';
import 'package:cerberus_ui/shared/widgets/pending_feature_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PendingFeatureScreen', () {
    testWidgets('Given a reserved route with no screen yet '
        'When it is shown '
        'Then it says the screen is not in this version', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: PendingFeatureScreen(),
        ),
      );

      expect(
        find.text('This screen is not available in this version yet.'),
        findsOneWidget,
      );
    });
  });
}
