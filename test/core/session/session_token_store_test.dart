import 'package:cerberus_ui/core/session/session_token_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/leak_recorder.dart';
import '../../support/recording_stores.dart';

void main() {
  group('SessionTokenStore', () {
    test('Given secure storage '
        'When a token is kept '
        'Then it is read back from secure storage and written nowhere else '
        '(FR-SE-06)', () async {
      final leaks = LeakRecorder();
      final store = SessionTokenStore(leaks.secureStore);

      await store.keep('TOKEN-MARKER');

      expect(await store.read(), 'TOKEN-MARKER');
      expect(
        await leaks.secureStore.read(SecureKey.sessionToken),
        'TOKEN-MARKER',
      );
      leaks.expectOnlyIn('TOKEN-MARKER', {LeakChannel.secureStorage});
    });

    test('Given unavailable secure storage '
        'When a token is kept '
        'Then it throws, so the caller can ask the user (UC-03 AF-05)', () {
      final secure = RecordingSecureStore()
        ..failure = const SecureStoreUnavailableException('no-keyring');
      final store = SessionTokenStore(secure);

      expect(
        () => store.keep('token'),
        throwsA(isA<SecureStoreUnavailableException>()),
      );
    });

    test(
      'Given unavailable secure storage '
      'When the token is read '
      'Then there is none, rather than an error that would block sign-in',
      () async {
        final secure = RecordingSecureStore()
          ..failure = const SecureStoreUnavailableException('no-keyring');

        expect(await SessionTokenStore(secure).read(), isNull);
      },
    );

    test(
      'Given unavailable secure storage '
      'When a token is held for this run '
      'Then it is read from memory and written nowhere (UC-03 AF-05)',
      () async {
        final leaks = LeakRecorder();
        leaks.secureStore.failure = const SecureStoreUnavailableException('x');
        final store = SessionTokenStore(leaks.secureStore);

        store.holdForThisRun('TOKEN-MARKER');

        expect(await store.read(), 'TOKEN-MARKER');
        leaks.expectNoLeak('TOKEN-MARKER');
      },
    );

    test(
      'Given a token held for this run '
      'When the store is cleared '
      'Then there is no token, and the unavailable store is not an error',
      () async {
        final secure = RecordingSecureStore()
          ..failure = const SecureStoreUnavailableException('x');
        final store = SessionTokenStore(secure)..holdForThisRun('token');

        await store.clear();

        expect(await store.read(), isNull);
      },
    );

    test('Given a kept token '
        'When the store is cleared '
        'Then secure storage no longer holds it', () async {
      final secure = RecordingSecureStore();
      final store = SessionTokenStore(secure);
      await store.keep('token');

      await store.clear();

      expect(await store.read(), isNull);
      expect(secure.values, isEmpty);
    });
  });
}
