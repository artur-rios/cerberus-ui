import 'dart:async';

import 'package:cerberus_api_client/export.dart';
import 'package:cerberus_ui/core/network/http_client.dart';
import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/session/session_token_store.dart';
import 'package:cerberus_ui/core/session/vault_state.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/data/api_session_repository.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';
import 'package:cerberus_ui/features/session/state/challenge_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/auth_payloads.dart';
import '../../../support/fake_session_repository.dart';
import '../../../support/leak_recorder.dart';

const _challengeToken = 'CHALLENGE-MARKER';
const _code = 'CODE-MARKER';
const _pending = ChallengePending(
  challengeToken: _challengeToken,
  methods: ['App'],
);

/// A container holding an outstanding challenge, whose completion runs
/// through the real repository, the real session and the leak recorder's
/// doubles.
ProviderContainer _container(
  LeakRecorder leaks, {
  SessionRepository? repository,
}) {
  final container = ProviderContainer(
    overrides: [
      secureStoreProvider.overrideWithValue(leaks.secureStore),
      preferencesStoreProvider.overrideWithValue(leaks.preferences),
      sessionRepositoryProvider.overrideWithValue(
        repository ??
            ApiSessionRepository(
              AuthClient(
                createHttpClient(
                  baseUrl: Uri.parse('https://vault.example'),
                  readToken: () async => null,
                  adapter: leaks.adapter,
                ),
              ),
            ),
      ),
    ],
  );
  addTearDown(container.dispose);
  container
      .read(sessionProvider.notifier)
      .challenge(challengeToken: _challengeToken, methods: const ['App']);
  // Keep the auto-disposed controller alive for the test.
  container.listen(challengeControllerProvider, (_, _) {});
  return container;
}

Future<void> _submit(ProviderContainer container, [String code = _code]) =>
    container.read(challengeControllerProvider.notifier).submit(code);

void main() {
  group('ChallengeController', () {
    test('Given an outstanding challenge '
        'When the screen opens '
        'Then it waits for the code', () {
      final container = _container(LeakRecorder());

      expect(container.read(challengeControllerProvider), isA<ChallengeIdle>());
    });

    test('Given a code the API accepts '
        'When it is submitted '
        'Then the challenge is discarded, a session exists with the vault '
        'locked, and the token reached secure storage and nothing else (UC-04 '
        'main flow, steps 4–6)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on(
        'POST',
        challengePath,
        challengeCompleted(token: 'TOKEN-MARKER', accountId: 'acct-1'),
      );
      final container = _container(leaks);

      await _submit(container);

      expect(
        container.read(challengeControllerProvider),
        isA<ChallengeCompletedState>(),
      );
      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
      expect(container.read(vaultStateProvider), const VaultLocked());
      leaks.expectOnlyIn('TOKEN-MARKER', {LeakChannel.secureStorage});
      leaks.expectOnlyIn(_code, {LeakChannel.request});
      leaks.expectOnlyIn(_challengeToken, {LeakChannel.request});
    });

    test(
      'Given a code '
      'When it is submitted '
      'Then it goes with the outstanding challenge\'s reference (step 4)',
      () async {
        final repository = FakeSessionRepository()
          ..nextChallenge = const Success(
            SignInCompleted(token: 't', accountId: 'a'),
          );
        final container = _container(LeakRecorder(), repository: repository);

        await _submit(container);

        expect(repository.challenges, [(_challengeToken, _code)]);
      },
    );

    test(
      'Given a code on its way '
      'When the API has not answered '
      'Then the controller is submitting and a second submission is ignored',
      () async {
        final repository = FakeSessionRepository()
          ..pendingChallenge = Completer();
        final container = _container(LeakRecorder(), repository: repository);

        final first = _submit(container);
        await _submit(container);

        expect(
          container.read(challengeControllerProvider),
          isA<ChallengeSubmitting>(),
        );
        expect(repository.challenges, hasLength(1));
        repository.pendingChallenge!.complete(
          const Failure(message: 'm', kind: FailureKind.serverError),
        );
        await first;
      },
    );

    test('Given a code the API refuses '
        'When it is submitted '
        'Then the API\'s reason is held, the challenge stays outstanding for '
        'another attempt, and no session exists (UC-04 AF-01)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on('POST', challengePath, challengeRefused());
      final container = _container(leaks);

      await _submit(container);

      final state = container.read(challengeControllerProvider);
      expect(state, isA<ChallengeRefused>());
      expect(
        (state as ChallengeRefused).failure.message,
        'authentication_required',
      );
      expect(container.read(sessionProvider), _pending);
      expect(await leaks.secureStore.read(SecureKey.sessionToken), isNull);
    });

    test('Given an expired challenge, which the API refuses like a wrong code '
        'When a code is submitted '
        'Then nothing is inferred from the refusal: the challenge stays '
        'outstanding, and leaving it is the user\'s choice (UC-04 AF-02, '
        'System Requirements §5.4)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on('POST', challengePath, challengeRefused());
      final container = _container(leaks);

      await _submit(container);
      await _submit(container, 'ANOTHER-CODE');

      expect(container.read(sessionProvider), _pending);
      expect(leaks.adapter.requests, hasLength(2));
    });

    test('Given a refused code '
        'When the user chooses to sign in again '
        'Then the challenge is discarded and the application is signed out '
        '(UC-04 AF-01, AF-02)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on('POST', challengePath, challengeRefused());
      final container = _container(leaks);
      await _submit(container);

      container.read(challengeControllerProvider.notifier).repeatSignIn();

      expect(container.read(sessionProvider), const SignedOut());
      leaks.expectOnlyIn(_challengeToken, {LeakChannel.request});
    });

    test('Given an unreachable instance '
        'When a code is submitted '
        'Then the connection is reported lost, the challenge stays, and a '
        'retry resends it with the same challenge (UC-04 AF-04)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks);

      await _submit(container);

      expect(
        container.read(challengeControllerProvider),
        isA<ChallengeConnectionLost>(),
      );
      expect(container.read(sessionProvider), _pending);

      leaks.adapter.on(
        'POST',
        challengePath,
        challengeCompleted(accountId: 'acct-1'),
      );
      await _submit(container);

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
      expect(
        leaks.adapter.requests.map((request) => request.body),
        everyElement(contains(_challengeToken)),
      );
    });

    test(
      'Given a code on its way '
      'When the challenge is abandoned before the API answers '
      'Then the answer is not kept and no session exists (UC-04 AF-03)',
      () async {
        final leaks = LeakRecorder();
        final repository = FakeSessionRepository()
          ..pendingChallenge = Completer();
        final container = _container(leaks, repository: repository);

        final submission = _submit(container);
        container.read(challengeControllerProvider.notifier).repeatSignIn();
        repository.pendingChallenge!.complete(
          const Success(SignInCompleted(token: 'TOKEN-MARKER', accountId: 'a')),
        );
        await submission;

        expect(container.read(sessionProvider), const SignedOut());
        leaks.expectNoLeak('TOKEN-MARKER');
      },
    );

    test('Given no outstanding challenge '
        'When a code is submitted '
        'Then nothing is sent', () async {
      final repository = FakeSessionRepository();
      final container = _container(LeakRecorder(), repository: repository);
      container
          .read(sessionProvider.notifier)
          .abandonChallenge(_challengeToken);

      await _submit(container);

      expect(repository.challenges, isEmpty);
    });

    group('when secure storage is unavailable', () {
      ProviderContainer unavailable(LeakRecorder leaks) {
        leaks.adapter.on(
          'POST',
          challengePath,
          challengeCompleted(token: 'TOKEN-MARKER', accountId: 'acct-1'),
        );
        leaks.secureStore.failure = const SecureStoreUnavailableException('x');
        return _container(leaks);
      }

      test('Given a code the API accepts '
          'When the token cannot be kept '
          'Then the user is asked, nothing is granted yet and nothing is '
          'written anywhere (step 6, as UC-03 AF-05)', () async {
        final leaks = LeakRecorder();
        final container = unavailable(leaks);

        await _submit(container);

        expect(
          container.read(challengeControllerProvider),
          isA<ChallengeSessionNotKept>(),
        );
        expect(container.read(sessionProvider), _pending);
        leaks.expectNoLeak('TOKEN-MARKER');
      });

      test('Given a session that cannot be kept '
          'When the user continues for this run '
          'Then the session exists with the token in memory only', () async {
        final leaks = LeakRecorder();
        final container = unavailable(leaks);
        await _submit(container);

        container
            .read(challengeControllerProvider.notifier)
            .continueForThisRun();

        expect(
          container.read(sessionProvider),
          const SignedIn(accountId: 'acct-1'),
        );
        expect(
          await container.read(sessionTokenStoreProvider).read(),
          'TOKEN-MARKER',
        );
        leaks.expectNoLeak('TOKEN-MARKER');
      });

      test(
        'Given a session that cannot be kept '
        'When the user declines '
        'Then the token is discarded and the user is back at sign-in',
        () async {
          final leaks = LeakRecorder();
          final container = unavailable(leaks);
          await _submit(container);

          container
              .read(challengeControllerProvider.notifier)
              .discardUnkeptSession();

          expect(container.read(sessionProvider), const SignedOut());
          expect(
            await container.read(sessionTokenStoreProvider).read(),
            isNull,
          );
        },
      );
    });
  });
}
