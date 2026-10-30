import 'package:cerberus_ui/core/config/preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/pump_app.dart';

void main() {
  group('CerberusApp', () {
    testWidgets('Given the application '
        'When it starts '
        'Then it is titled from the localizations and themed in Material 3, '
        'light and dark', (tester) async {
      await pumpCerberusApp(tester);

      final app = tester.widget<MaterialApp>(find.byType(MaterialApp));

      expect(
        app.onGenerateTitle!(tester.element(find.byType(Scaffold))),
        'Cerberus',
      );
      expect(app.theme!.useMaterial3, isTrue);
      expect(app.darkTheme!.colorScheme.brightness, Brightness.dark);
      expect(app.supportedLocales, contains(const Locale('en')));
    });

    testWidgets('Given the defaults '
        'When the theme preference changes '
        'Then the application follows it at once (UC-10 step 3)', (
      tester,
    ) async {
      final container = await pumpCerberusApp(tester);
      MaterialApp app() => tester.widget<MaterialApp>(find.byType(MaterialApp));
      expect(app().themeMode, ThemeMode.system);

      await container
          .read(preferencesProvider.notifier)
          .setThemeMode(ThemeMode.dark);
      await tester.pumpAndSettle();

      expect(app().themeMode, ThemeMode.dark);
      expect(
        Theme.of(tester.element(find.byType(Scaffold))).brightness,
        Brightness.dark,
      );
    });
  });
}
