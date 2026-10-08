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
  });
}
