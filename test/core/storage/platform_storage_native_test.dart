import 'package:cerberus_ui/core/storage/platform_storage_native.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _MockSecureStorage extends Mock implements FlutterSecureStorage {}

class _MockPreferences extends Mock implements SharedPreferencesAsync {}

void main() {
  group('createSecureStore and createPreferencesStore', () {
    test('Given Windows, Linux or Android '
        'When the stores are created '
        'Then they are the platform-backed ones', () {
      expect(createSecureStore(), isA<PlatformSecureStore>());
      expect(createPreferencesStore(), isA<PlatformPreferencesStore>());
    });
  });

  group('PlatformSecureStore', () {
    late _MockSecureStorage storage;
    late PlatformSecureStore store;

    setUp(() {
      storage = _MockSecureStorage();
      store = PlatformSecureStore(storage);
    });

    test('Given a token '
        'When it is written, read and deleted '
        'Then each goes to the platform store under the token key', () async {
      when(
        () => storage.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenAnswer((_) async {});
      when(() => storage.read(key: any(named: 'key')))
          .thenAnswer((_) async => 'token-1');
      when(() => storage.delete(key: any(named: 'key')))
          .thenAnswer((_) async {});

      await store.write(SecureKey.sessionToken, 'token-1');
      final read = await store.read(SecureKey.sessionToken);
      await store.delete(SecureKey.sessionToken);

      expect(read, 'token-1');
      verify(
        () => storage.write(key: 'cerberus.session.token', value: 'token-1'),
      ).called(1);
      verify(() => storage.delete(key: 'cerberus.session.token')).called(1);
    });

    test('Given a platform store that is unavailable '
        'When it is used '
        'Then the failure is reported by code alone, never echoing a value '
        '(UC-03 AF-05)', () async {
      when(
        () => storage.write(
          key: any(named: 'key'),
          value: any(named: 'value'),
        ),
      ).thenThrow(
        PlatformException(code: 'NoKeyring', message: 'value TOKEN-MARKER'),
      );

      await expectLater(
        store.write(SecureKey.sessionToken, 'TOKEN-MARKER'),
        throwsA(
          isA<SecureStoreUnavailableException>()
              .having((e) => e.reason, 'reason', 'NoKeyring')
              .having(
                (e) => e.toString(),
                'string',
                isNot(contains('TOKEN-MARKER')),
              ),
        ),
      );
    });
  });

  group('PlatformPreferencesStore', () {
    test('Given a preference '
        'When it is written, read and removed '
        'Then each goes to the platform store under its key', () async {
      final preferences = _MockPreferences();
      final store = PlatformPreferencesStore(preferences);
      when(() => preferences.setString(any(), any())).thenAnswer((_) async {});
      when(() => preferences.getString(any())).thenAnswer((_) async => 'dark');
      when(() => preferences.remove(any())).thenAnswer((_) async {});

      await store.write(PreferenceKey.themeMode, 'dark');
      final read = await store.read(PreferenceKey.themeMode);
      await store.remove(PreferenceKey.themeMode);

      expect(read, 'dark');
      verify(
        () => preferences.setString('cerberus.preference.themeMode', 'dark'),
      ).called(1);
      verify(() => preferences.remove('cerberus.preference.themeMode'))
          .called(1);
    });
  });
}
