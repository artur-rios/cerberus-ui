import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MemorySecureStore', () {
    test('Given a written token '
        'When it is read and then deleted '
        'Then it is returned once and gone after', () async {
      final store = MemorySecureStore();

      await store.write(SecureKey.sessionToken, 'token-1');
      final read = await store.read(SecureKey.sessionToken);
      await store.delete(SecureKey.sessionToken);

      expect(read, 'token-1');
      expect(await store.read(SecureKey.sessionToken), isNull);
    });

    test('Given nothing stored '
        'When an absent key is deleted '
        'Then it is not an error', () async {
      await MemorySecureStore().delete(SecureKey.sessionToken);
    });
  });

  group('SecureStoreUnavailableException', () {
    test('Given a platform reason '
        'When it is turned into a string '
        'Then it carries the reason', () {
      expect(
        const SecureStoreUnavailableException('NoKeyring').toString(),
        contains('NoKeyring'),
      );
    });
  });
}
