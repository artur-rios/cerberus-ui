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
import 'package:cerberus_ui/features/session/state/sign_in_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/auth_payloads.dart';
import '../../../support/fake_session_repository.dart';
import '../../../support/leak_recorder.dart';
import '../../../support/stub_http_adapter.dart';

const _email = 'owner@example.com';
const _password = 'PASSWORD-MARKER';

/// A container whose sign-in runs through the real repository, the real
/// session and the leak recorder's doubles.
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
  // Keep the auto-disposed controller alive for the test.
  container.listen(signInControllerProvider, (_, _) {});
  return container;
}

Future<void> _submit(ProviderContainer container) => container
    .read(signInControllerProvider.notifier)
    .submit(email: _email, password: _password);

void main() {
  group('SignInController', () {
    test('Given a new sign-in form '
        'When it is read '
        'Then it is idle', () {
      final container = _container(LeakRecorder());

      expect(container.read(signInControllerProvider), isA<SignInIdle>());
    });

    test(
      'Given credentials the API accepts '
      'When they are submitted '
      'Then a session exists with the vault locked, and the token reached '
      'secure storage and nothing else (UC-03 main flow, FR-SE-06)',
      () async {
        final leaks = LeakRecorder();
        leaks.adapter.on(
          'POST',
          loginPath,
          loginCompleted(token: 'TOKEN-MARKER', accountId: 'acct-1'),
        );
        final container = _container(leaks);

        await _submit(container);

        expect(
          container.read(signInControllerProvider),
          isA<SignInCompletedState>(),
        );
        expect(
          container.read(sessionProvider),
          const SignedIn(accountId: 'acct-1'),
        );
        expect(container.read(vaultStateProvider), const VaultLocked());
        leaks.expectOnlyIn('TOKEN-MARKER', {LeakChannel.secureStorage});
        leaks.expectOnlyIn(_password, {LeakChannel.request});
      },
    );

    test('Given a completed sign-in '
        'When a later request is made '
        'Then the token travels as a header and never in a URL (UC-03 step 5, '
        'FR-DA-04)', () async {
      final leaks = LeakRecorder();
      leaks.adapter
        ..on('POST', loginPath, loginCompleted(token: 'TOKEN-MARKER'))
        ..on('GET', '/api/accounts/me', const StubResponse(200, {}));
      final container = _container(leaks);
      await _submit(container);
      final later = createHttpClient(
        baseUrl: Uri.parse('https://vault.example'),
        readToken: container.read(sessionTokenStoreProvider).read,
        adapter: leaks.adapter,
      );

      await later.get<Object?>('/api/accounts/me');

      expect(
        leaks.adapter.requests.last.headers['Authorization'],
        'Bearer TOKEN-MARKER',
      );
      leaks.expectOnlyIn('TOKEN-MARKER', {
        LeakChannel.secureStorage,
        LeakChannel.requestHeader,
      });
    });

    test('Given a sign-in the API challenges '
        'When the credentials are submitted '
        'Then the challenge is held, no token is stored and nothing is granted '
        '(UC-03 AF-02, FR-SE-04)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on(
        'POST',
        loginPath,
        loginChallenged(challengeToken: 'CHALLENGE-MARKER', methods: ['totp']),
      );
      final container = _container(leaks);

      await _submit(container);

      expect(
        container.read(signInControllerProvider),
        isA<SignInChallengedState>(),
      );
      expect(
        container.read(sessionProvider),
        const ChallengePending(
          challengeToken: 'CHALLENGE-MARKER',
          methods: ['totp'],
        ),
      );
      expect(leaks.secureStore.writes, isEmpty);
      leaks.expectNoLeak('CHALLENGE-MARKER');
    });

    test('Given credentials the API rejects '
        'When they are submitted '
        'Then the API\'s reason is the state and no session exists '
        '(UC-03 AF-01)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on(
        'POST',
        loginPath,
        loginRefused(401, 'authentication_required'),
      );
      final container = _container(leaks);

      await _submit(container);

      final state = container.read(signInControllerProvider) as SignInFailed;
      expect(state.failure.message, 'authentication_required');
      expect(state.credentialsRejected, isTrue);
      expect(state.isConnectionLost, isFalse);
      expect(container.read(sessionProvider), const SignedOut());
      expect(leaks.secureStore.writes, isEmpty);
    });

    test('Given an unreachable instance '
        'When the credentials are submitted '
        'Then the state is a lost connection and no session is assumed '
        '(UC-03 AF-03)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks);

      await _submit(container);

      final state = container.read(signInControllerProvider) as SignInFailed;
      expect(state.isConnectionLost, isTrue);
      expect(container.read(sessionProvider), const SignedOut());
    });

    test('Given a lost connection '
        'When the sign-in is retried and the API answers '
        'Then the session is established (UC-03 AF-03)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks);
      await _submit(container);
      leaks.adapter.on('POST', loginPath, loginCompleted(accountId: 'acct-1'));

      await _submit(container);

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
    });

    test(
      'Given the API refuses for another reason '
      'When the credentials are submitted '
      'Then that reason is the state, unchanged (UC-03 AF-04, FR-DA-06)',
      () async {
        final leaks = LeakRecorder();
        leaks.adapter.on(
          'POST',
          loginPath,
          loginRefused(403, 'authentication_forbidden'),
        );
        final container = _container(leaks);

        await _submit(container);

        final state = container.read(signInControllerProvider) as SignInFailed;
        expect(state.failure.message, 'authentication_forbidden');
        expect(state.credentialsRejected, isFalse);
        expect(container.read(sessionProvider), const SignedOut());
      },
    );

    test('Given secure storage is unavailable '
        'When the API completes the login '
        'Then no session exists yet and the user is asked, with the token '
        'written nowhere (UC-03 AF-05)', () async {
      final leaks = LeakRecorder();
      leaks.secureStore.failure = const SecureStoreUnavailableException('x');
      leaks.adapter.on(
        'POST',
        loginPath,
        loginCompleted(token: 'TOKEN-MARKER'),
      );
      final container = _container(leaks);

      await _submit(container);

      expect(
        container.read(signInControllerProvider),
        isA<SignInSessionNotKept>(),
      );
      expect(container.read(sessionProvider), const SignedOut());
      leaks.expectNoLeak('TOKEN-MARKER');
    });

    test(
      'Given a session secure storage could not keep '
      'When the user continues for this run '
      'Then the session exists with its token in memory only (UC-03 AF-05)',
      () async {
        final leaks = LeakRecorder();
        leaks.secureStore.failure = const SecureStoreUnavailableException('x');
        leaks.adapter.on(
          'POST',
          loginPath,
          loginCompleted(token: 'TOKEN-MARKER', accountId: 'acct-1'),
        );
        final container = _container(leaks);
        await _submit(container);

        container.read(signInControllerProvider.notifier).continueForThisRun();

        expect(
          container.read(sessionProvider),
          const SignedIn(accountId: 'acct-1'),
        );
        expect(
          await container.read(sessionTokenStoreProvider).read(),
          'TOKEN-MARKER',
        );
        leaks.expectNoLeak('TOKEN-MARKER');
      },
    );

    test(
      'Given a session secure storage could not keep '
      'When the user declines '
      'Then the token is discarded and no session exists (UC-03 AF-05)',
      () async {
        final leaks = LeakRecorder();
        leaks.secureStore.failure = const SecureStoreUnavailableException('x');
        leaks.adapter.on('POST', loginPath, loginCompleted());
        final container = _container(leaks);
        await _submit(container);

        final controller = container.read(signInControllerProvider.notifier)
          ..discardUnkeptSession()
          ..continueForThisRun();

        expect(controller.state, isA<SignInIdle>());
        expect(container.read(sessionProvider), const SignedOut());
        expect(await container.read(sessionTokenStoreProvider).read(), isNull);
      },
    );

    test('Given no session waiting for a decision '
        'When continue is called '
        'Then nothing happens', () {
      final container = _container(LeakRecorder());

      container.read(signInControllerProvider.notifier).continueForThisRun();

      expect(container.read(sessionProvider), const SignedOut());
    });

    test('Given a sign-in in flight '
        'When it is submitted again '
        'Then the second submission is ignored', () async {
      final repository = FakeSessionRepository()..pending = Completer();
      final container = _container(LeakRecorder(), repository: repository);

      final first = _submit(container);
      await _submit(container);
      expect(container.read(signInControllerProvider), isA<SignInSubmitting>());
      repository.pending!.complete(
        const Success(SignInCompleted(token: 't', accountId: 'acct-1')),
      );
      await first;

      expect(repository.emails, hasLength(1));
    });

    test('Given a sign-in in flight '
        'When the form is left before the API answers '
        'Then the answer changes nothing on the gone form', () async {
      final repository = FakeSessionRepository()..pending = Completer();
      final container = ProviderContainer(
        overrides: [
          secureStoreProvider.overrideWithValue(LeakRecorder().secureStore),
          sessionRepositoryProvider.overrideWithValue(repository),
        ],
      );
      addTearDown(container.dispose);
      final subscription = container.listen(
        signInControllerProvider,
        (_, _) {},
      );
      final submitting = _submit(container);

      subscription.close();
      await pumpEventQueue();
      repository.pending!.complete(
        const Failure(message: 'm', kind: FailureKind.serverError),
      );
      await submitting;

      expect(container.read(sessionProvider), const SignedOut());
    });
  });
}
