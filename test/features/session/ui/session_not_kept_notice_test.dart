import 'package:cerberus_ui/features/session/ui/session_not_kept_notice.dart';
import 'package:cerberus_ui/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _continue = Key('continue');
const _discard = Key('discard');

Future<List<String>> _pump(WidgetTester tester) async {
  final chosen = <String>[];
  await tester.pumpWidget(
    MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: SessionNotKeptNotice(
          continueKey: _continue,
          discardKey: _discard,
          onContinue: () => chosen.add('continue'),
          onDiscard: () => chosen.add('discard'),
        ),
      ),
    ),
  );
  return chosen;
}

void main() {
  group('SessionNotKeptNotice', () {
    testWidgets('Given secure storage that cannot keep a session '
        'When the notice is shown '
        'Then it says so and that nothing is written elsewhere (UC-03 AF-05)', (
      tester,
    ) async {
      await _pump(tester);

      expect(find.text("This session can't be kept"), findsOneWidget);
      expect(
        find.textContaining(
          'Nothing will be saved to a file or to preferences',
        ),
        findsOneWidget,
      );
    });

    for (final (key, choice) in [
      (_continue, 'continue'),
      (_discard, 'discard'),
    ]) {
      testWidgets('Given the notice '
          'When the user chooses to $choice '
          'Then that choice, and only it, is reported', (tester) async {
        final chosen = await _pump(tester);

        await tester.tap(find.byKey(key));

        expect(chosen, [choice]);
      });
    }
  });
}
