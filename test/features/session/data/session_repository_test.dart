import 'package:cerberus_ui/core/config/app_config.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/data/api_session_repository.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/recording_stores.dart';

void main() {
  group('SignInOutcome', () {
    test(
      'Given a completed login '
      'When it is printed '
      'Then the token is not, because a toString is how values reach logs',
      () {
        const completed = SignInCompleted(
          token: 'TOKEN-MARKER',
          accountId: 'acct-1',
        );

        expect('$completed', isNot(contains('TOKEN-MARKER')));
        expect('$completed', contains('acct-1'));
      },
    );

    test('Given a challenged login '
        'When it is printed '
        'Then the challenge reference is not', () {
      const challenged = SignInChallenged(
        challengeToken: 'CHALLENGE-MARKER',
        methods: ['totp'],
      );

      expect('$challenged', isNot(contains('CHALLENGE-MARKER')));
    });
  });

  group('sessionRepositoryProvider', () {
    test('Given an adopted instance '
        'When the repository is read '
        'Then it is the API-backed one (FR-DA-01)', () {
      final container = ProviderContainer(
        overrides: [
          appConfigProvider.overrideWithValue(
            const AppConfig(
              apiBaseUrl: 'https://vault.example',
              allowPlainHttp: false,
            ),
          ),
          secureStoreProvider.overrideWithValue(RecordingSecureStore()),
          preferencesStoreProvider.overrideWithValue(
            RecordingPreferencesStore(),
          ),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(sessionRepositoryProvider),
        isA<ApiSessionRepository>(),
      );
    });
  });
}
