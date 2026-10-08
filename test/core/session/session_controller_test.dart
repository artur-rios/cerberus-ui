import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/session/vault_state.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/leak_recorder.dart';

class _UnlockedVault extends VaultStateController {
  @override
  VaultState build() => const VaultUnlocked(profileId: 'profile-1');
}

ProviderContainer _container(LeakRecorder leaks, {bool unlocked = false}) {
  final container = ProviderContainer(
    overrides: [
      secureStoreProvider.overrideWithValue(leaks.secureStore),
      preferencesStoreProvider.overrideWithValue(leaks.preferences),
      if (unlocked) vaultStateProvider.overrideWith(_UnlockedVault.new),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('SessionController', () {
    test('Given a new application '
        'When the session is read '
        'Then it is signed out and the vault locked', () {
      final container = _container(LeakRecorder());

      expect(container.read(sessionProvider), const SignedOut());
      expect(container.read(vaultStateProvider), const VaultLocked());
    });

    test('Given a sign-in the API challenged '
        'When the challenge is recorded '
        'Then nothing is stored and nothing is logged with it (FR-SE-04)', () {
      final leaks = LeakRecorder();
      final container = _container(leaks);

      container
          .read(sessionProvider.notifier)
          .challenge(challengeToken: 'CHALLENGE-MARKER', methods: ['totp']);

      expect(
        container.read(sessionProvider),
        const ChallengePending(
          challengeToken: 'CHALLENGE-MARKER',
          methods: ['totp'],
        ),
      );
      leaks.expectNoLeak('CHALLENGE-MARKER');
    });

    test('Given a completed sign-in '
        'When the session is established '
        'Then the token reaches secure storage and nowhere else, and the '
        'vault stays locked (FR-SE-06)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks);

      await container
          .read(sessionProvider.notifier)
          .establish(token: 'TOKEN-MARKER', accountId: 'acct-1');

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
      expect(container.read(vaultStateProvider), const VaultLocked());
      expect(
        await leaks.secureStore.read(SecureKey.sessionToken),
        'TOKEN-MARKER',
      );
      leaks.expectOnlyIn('TOKEN-MARKER', {LeakChannel.secureStorage});
    });

    test('Given an unlocked vault '
        'When the session ends '
        'Then the vault locks, the token is deleted and the state is signed '
        'out (FR-SE-11)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks, unlocked: true);
      await container
          .read(sessionProvider.notifier)
          .establish(token: 'token', accountId: 'acct-1');

      await container.read(sessionProvider.notifier).end();

      expect(container.read(sessionProvider), const SignedOut());
      expect(container.read(vaultStateProvider), const VaultLocked());
      expect(await leaks.secureStore.read(SecureKey.sessionToken), isNull);
    });

    test('Given no session '
        'When the session ends '
        'Then it is not an error', () async {
      final container = _container(LeakRecorder());

      await container.read(sessionProvider.notifier).end();

      expect(container.read(sessionProvider), const SignedOut());
    });
  });

  group('VaultStateController', () {
    test('Given an unlocked vault '
        'When it is locked '
        'Then it is locked', () {
      final container = _container(LeakRecorder(), unlocked: true);

      container.read(vaultStateProvider.notifier).lock();

      expect(container.read(vaultStateProvider), const VaultLocked());
    });
  });
}
