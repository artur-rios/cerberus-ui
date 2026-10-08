import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_notice.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/session/session_token_store.dart';
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

    test('Given unavailable secure storage '
        'When a session is established '
        'Then it throws and no session exists (UC-03 AF-05)', () async {
      final leaks = LeakRecorder();
      leaks.secureStore.failure = const SecureStoreUnavailableException('x');
      final container = _container(leaks);

      await expectLater(
        container
            .read(sessionProvider.notifier)
            .establish(token: 'TOKEN-MARKER', accountId: 'acct-1'),
        throwsA(isA<SecureStoreUnavailableException>()),
      );

      expect(container.read(sessionProvider), const SignedOut());
      leaks.expectNoLeak('TOKEN-MARKER');
    });

    test('Given unavailable secure storage the user accepted '
        'When the session is established for this run '
        'Then it is signed in with the vault locked, and the token is held in '
        'memory and written nowhere (UC-03 AF-05)', () async {
      final leaks = LeakRecorder();
      leaks.secureStore.failure = const SecureStoreUnavailableException('x');
      final container = _container(leaks);

      container
          .read(sessionProvider.notifier)
          .establishForThisRun(token: 'TOKEN-MARKER', accountId: 'acct-1');

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
      expect(container.read(vaultStateProvider), const VaultLocked());
      expect(
        await container.read(sessionTokenStoreProvider).read(),
        'TOKEN-MARKER',
      );
      leaks.expectNoLeak('TOKEN-MARKER');
    });

    test('Given a session held for this run '
        'When the session ends '
        'Then the token is gone from memory too', () async {
      final leaks = LeakRecorder();
      leaks.secureStore.failure = const SecureStoreUnavailableException('x');
      final container = _container(leaks);
      container
          .read(sessionProvider.notifier)
          .establishForThisRun(token: 'token', accountId: 'acct-1');

      await container.read(sessionProvider.notifier).end();

      expect(container.read(sessionProvider), const SignedOut());
      expect(await container.read(sessionTokenStoreProvider).read(), isNull);
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

    test('Given an outstanding challenge '
        'When it is abandoned '
        'Then the application is signed out and nothing was stored (UC-04 '
        'AF-03)', () {
      final leaks = LeakRecorder();
      final container = _container(leaks);
      final session = container.read(sessionProvider.notifier)
        ..challenge(challengeToken: 'CHALLENGE-MARKER', methods: ['App']);

      session.abandonChallenge('CHALLENGE-MARKER');

      expect(container.read(sessionProvider), const SignedOut());
      leaks.expectNoLeak('CHALLENGE-MARKER');
    });

    test('Given a challenge replaced by a later sign-in '
        'When the earlier one is abandoned '
        'Then the later one stays outstanding', () {
      final container = _container(LeakRecorder());
      final session = container.read(sessionProvider.notifier)
        ..challenge(challengeToken: 'first', methods: ['App'])
        ..challenge(challengeToken: 'second', methods: ['Email']);

      session.abandonChallenge('first');

      expect(
        container.read(sessionProvider),
        const ChallengePending(challengeToken: 'second', methods: ['Email']),
      );
    });

    test('Given a challenge completed into a session '
        'When it is abandoned afterwards '
        'Then the session stays', () async {
      final container = _container(LeakRecorder());
      final session = container.read(sessionProvider.notifier)
        ..challenge(challengeToken: 'c', methods: ['App']);
      await session.establish(token: 'token', accountId: 'acct-1');

      session.abandonChallenge('c');

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
    });

    for (final (hasProtection, vault) in const [
      (true, VaultLocked()),
      (false, VaultProtectionUninitialized()),
    ]) {
      test('Given a stored session the API accepted, protection '
          '${hasProtection ? 'found' : 'not found'} '
          'When it is restored '
          'Then the session is signed in naming no account, the vault is '
          '$vault, and nothing is written (UC-05 step 5)', () {
        final leaks = LeakRecorder();
        final container = _container(leaks);

        container
            .read(sessionProvider.notifier)
            .restore(hasProtection: hasProtection);

        expect(
          container.read(sessionProvider),
          const SignedIn(accountId: null),
        );
        expect(container.read(vaultStateProvider), vault);
        expect(leaks.secureStore.writes, isEmpty);
        expect(leaks.preferences.writes, isEmpty);
      });
    }

    test('Given a restored session whose account has no protection '
        'When the session ends '
        'Then the vault is locked and what was known of the protection is '
        'forgotten with the session', () async {
      final container = _container(LeakRecorder());
      final session = container.read(sessionProvider.notifier)
        ..restore(hasProtection: false);

      await session.end();

      expect(container.read(vaultStateProvider), const VaultLocked());
    });

    test('Given a session '
        'When the user signs out '
        'Then the token is gone from secure storage, nothing about it '
        'reached preferences or a log, and sign-in has nothing to say '
        '(UC-06 steps 3-5, FR-SE-11)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks, unlocked: true);
      final session = container.read(sessionProvider.notifier);
      await session.establish(token: 'TOKEN-MARKER', accountId: 'acct-1');

      await session.end();

      expect(container.read(sessionProvider), const SignedOut());
      expect(container.read(vaultStateProvider), const VaultLocked());
      expect(leaks.secureStore.values, isEmpty);
      expect(await container.read(sessionTokenStoreProvider).read(), isNull);
      expect(container.read(sessionNoticeProvider), isEmpty);
      leaks.expectOnlyIn('TOKEN-MARKER', {LeakChannel.secureStorage});
    });

    test(
      'Given a session '
      'When the API rejects its token '
      'Then the session ends and sign-in will say it ended (UC-06 AF-04)',
      () async {
        final container = _container(LeakRecorder());
        final session = container.read(sessionProvider.notifier);
        await session.establish(token: 'token', accountId: 'acct-1');

        await session.end(cause: SessionEndCause.tokenRejected);

        expect(container.read(sessionProvider), const SignedOut());
        expect(container.read(sessionNoticeProvider), {
          SessionNotice.sessionEnded,
        });
      },
    );

    test(
      'Given a token secure storage cannot delete '
      'When the user signs out '
      'Then the failure is reported, and the vault still locks, the state '
      'is still discarded and sign-in is still reached (UC-06 AF-03)',
      () async {
        final leaks = LeakRecorder();
        final container = _container(leaks, unlocked: true);
        final session = container.read(sessionProvider.notifier);
        await session.establish(token: 'TOKEN-MARKER', accountId: 'acct-1');
        leaks.secureStore.deleteFailure = const SecureStoreUnavailableException(
          'locked',
        );

        await session.end();

        expect(container.read(sessionProvider), const SignedOut());
        expect(container.read(vaultStateProvider), const VaultLocked());
        expect(container.read(sessionNoticeProvider), {
          SessionNotice.tokenNotDeleted,
        });
        expect(await container.read(sessionTokenStoreProvider).read(), isNull);
        leaks.expectOnlyIn('TOKEN-MARKER', {LeakChannel.secureStorage});
      },
    );

    test('Given notices left by an earlier ending '
        'When the session ends again '
        'Then they are discarded with the rest of the in-memory state (UC-06 '
        'step 5)', () async {
      final container = _container(LeakRecorder());
      container.read(sessionNoticeProvider.notifier)
        ..post(SessionNotice.tokenNotDeleted)
        ..post(SessionNotice.vaultNotRemoved);

      await container.read(sessionProvider.notifier).end();

      expect(container.read(sessionNoticeProvider), isEmpty);
    });

    test('Given a notice about the last session '
        'When a new session is established '
        'Then the notice is discarded', () async {
      final container = _container(LeakRecorder());
      container
          .read(sessionNoticeProvider.notifier)
          .post(SessionNotice.sessionEnded);

      await container
          .read(sessionProvider.notifier)
          .establish(token: 'token', accountId: 'acct-1');

      expect(container.read(sessionNoticeProvider), isEmpty);
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

    test('Given a locked vault '
        'When protection is recorded as absent, then present '
        'Then it awaits setup, then is locked (UC-05 step 5)', () {
      final container = _container(LeakRecorder());
      final vault = container.read(vaultStateProvider.notifier)
        ..recordProtection(exists: false);

      expect(
        container.read(vaultStateProvider),
        const VaultProtectionUninitialized(),
      );

      vault.recordProtection(exists: true);

      expect(container.read(vaultStateProvider), const VaultLocked());
    });
  });
}
