import 'package:cerberus_ui/core/storage/platform_storage_web.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('The web storage wrappers', () {
    test('Given the web '
        'When the stores are created '
        'Then both are memory-only (IR-07)', () {
      expect(createSecureStore(), isA<MemorySecureStore>());
      expect(createPreferencesStore(), isA<MemoryPreferencesStore>());
    });

    test('Given the web stores '
        'When a token and a preference are written and read back '
        'Then they live in memory and nothing reaches any platform channel '
        '(Testing Specification §6.4, FR-OF-16)', () async {
      final messages = <String>[];
      final messenger =
          TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger;
      messenger.allMessagesHandler = (channel, handler, message) async {
        messages.add(channel);
        return null;
      };
      addTearDown(() => messenger.allMessagesHandler = null);
      final secure = createSecureStore();
      final preferences = createPreferencesStore();

      await secure.write(SecureKey.sessionToken, 'token-1');
      await preferences.write(PreferenceKey.themeMode, 'dark');

      expect(await secure.read(SecureKey.sessionToken), 'token-1');
      expect(await preferences.read(PreferenceKey.themeMode), 'dark');
      expect(messages, isEmpty);
    });

    test('Given values written by one run '
        'When a fresh store is created, as after a reload '
        'Then nothing is there (FR-OF-16)', () async {
      await createSecureStore().write(SecureKey.sessionToken, 'token-1');

      expect(await createSecureStore().read(SecureKey.sessionToken), isNull);
    });
  });
}
