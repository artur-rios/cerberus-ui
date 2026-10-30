import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PreferenceKey', () {
    test('Given every preference key '
        'When their names are read '
        'Then none is a place a token, credential or key could be written '
        '(IR-07)', () {
      const forbidden = ['token', 'password', 'secret', 'credential', 'key'];

      for (final key in PreferenceKey.values) {
        for (final word in forbidden) {
          expect(
            key.storageKey.toLowerCase().contains(word),
            isFalse,
            reason: '${key.storageKey} must not suggest "$word"',
          );
        }
      }
    });

    test('Given every preference key '
        'When their storage names are read '
        'Then they are distinct', () {
      final names = PreferenceKey.values.map((key) => key.storageKey);

      expect(names.toSet(), hasLength(PreferenceKey.values.length));
    });
  });

  group('MemoryPreferencesStore', () {
    test('Given a written preference '
        'When it is read and then removed '
        'Then it is returned once and gone after', () async {
      final store = MemoryPreferencesStore();

      await store.write(PreferenceKey.themeMode, 'dark');
      final read = await store.read(PreferenceKey.themeMode);
      await store.remove(PreferenceKey.themeMode);

      expect(read, 'dark');
      expect(await store.read(PreferenceKey.themeMode), isNull);
    });
  });
}
