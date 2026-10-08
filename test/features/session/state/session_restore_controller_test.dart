import 'dart:async';

import 'package:cerberus_ui/core/config/app_config.dart';
import 'package:cerberus_ui/core/network/http_client.dart';
import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/session/vault_state.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';
import 'package:cerberus_ui/features/session/state/session_restore_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/fake_session_repository.dart';
import '../../../support/leak_recorder.dart';
import '../../../support/vault_payloads.dart';

const _token = 'TOKEN-MARKER';

/// A container restoring through the real session, the real HTTP client and
/// repository unless [repository] replaces it, and the leak recorder's
/// doubles. [token] is what secure storage holds at start; an empty
/// [instance] adopts none.
ProviderContainer _container(
  LeakRecorder leaks, {
  String? token = _token,
  String instance = 'https://vault.example',
  SessionRepository? repository,
}) {
  if (token != null) leaks.secureStore.values[SecureKey.sessionToken] = token;
  final container = ProviderContainer(
    overrides: [
      appConfigProvider.overrideWithValue(
        AppConfig(apiBaseUrl: instance, allowPlainHttp: false),
      ),
      secureStoreProvider.overrideWithValue(leaks.secureStore),
      preferencesStoreProvider.overrideWithValue(leaks.preferences),
      if (repository != null)
        sessionRepositoryProvider.overrideWithValue(repository),
    ],
  );
  addTearDown(container.dispose);
  if (instance.isNotEmpty && repository == null) {
    container.read(httpClientProvider).httpClientAdapter = leaks.adapter;
  }
  return container;
}

Future<void> _restore(ProviderContainer container) =>
    container.read(sessionRestoreProvider.notifier).restore();

void main() {
  group('SessionRestoreController', () {
    test('Given a new application '
        'When nothing has been restored '
        'Then the start is not held', () {
      final container = _container(LeakRecorder(), token: null);

      expect(
        container.read(sessionRestoreProvider),
        const SessionRestoreSettled(),
      );
      expect(container.read(sessionRestoreProvider).holdsStart, isFalse);
    });

    test('Given a stored token '
        'When the restore begins '
        'Then the start is held before anything is awaited, so no screen '
        'that depends on the session can show (step 2, FR-SE-08)', () async {
      final repository = FakeSessionRepository()
        ..pendingVerification = Completer();
      final container = _container(LeakRecorder(), repository: repository);

      final restoring = _restore(container);

      expect(
        container.read(sessionRestoreProvider),
        const SessionRestoreVerifying(),
      );
      expect(container.read(sessionRestoreProvider).holdsStart, isTrue);
      expect(container.read(sessionProvider), const SignedOut());

      repository.pendingVerification!.complete(
        const Success(SessionVerification.protectionFound),
      );
      await restoring;
    });

    test('Given a stored token and an account with protection '
        'When the API accepts it '
        'Then the session is signed in with the vault locked, the start is '
        'released, and nothing is written (steps 3–5)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on('GET', protectionPath, protectionFound());
      final container = _container(leaks);

      await _restore(container);

      expect(container.read(sessionProvider), const SignedIn(accountId: null));
      expect(container.read(vaultStateProvider), const VaultLocked());
      expect(
        container.read(sessionRestoreProvider),
        const SessionRestoreSettled(),
      );
      expect(leaks.secureStore.writes, isEmpty);
      expect(leaks.preferences.writes, isEmpty);
    });

    test('Given a stored token and no protection, or no active account '
        'When the API answers not_found '
        'Then the token was accepted: the session is signed in and the vault '
        'awaits setup (steps 4–5)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on('GET', protectionPath, protectionNotFound());
      final container = _container(leaks);

      await _restore(container);

      expect(container.read(sessionProvider), const SignedIn(accountId: null));
      expect(
        container.read(vaultStateProvider),
        const VaultProtectionUninitialized(),
      );
      expect(leaks.secureStore.values, contains(SecureKey.sessionToken));
    });

    test('Given protection material in the answer '
        'When the session is restored '
        'Then none of it leaves memory, and the token reaches only the '
        'request header (step 3, Testing Specification §6.4)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on(
        'GET',
        protectionPath,
        protectionFound(marker: 'MATERIAL-MARKER'),
      );
      final container = _container(leaks);

      await _restore(container);

      leaks
        ..expectNoLeak('MATERIAL-MARKER')
        ..expectOnlyIn(_token, {LeakChannel.requestHeader});
    });

    test('Given no stored token '
        'When the restore runs '
        'Then nothing is requested, the application stays signed out and the '
        'start is released for sign-in (AF-01, AF-05)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks, token: null);

      await _restore(container);

      expect(leaks.adapter.requests, isEmpty);
      expect(container.read(sessionProvider), const SignedOut());
      expect(
        container.read(sessionRestoreProvider),
        const SessionRestoreSettled(),
      );
    });

    test('Given unavailable secure storage '
        'When the restore runs '
        'Then it reads as no stored token (AF-01)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks, token: null);
      leaks.secureStore.failure = const SecureStoreUnavailableException(
        'unavailable',
      );

      await _restore(container);

      expect(leaks.adapter.requests, isEmpty);
      expect(container.read(sessionProvider), const SignedOut());
    });

    test('Given a stored token the API rejects '
        'When the restore runs '
        'Then the token is deleted, the application is signed out, and '
        'sign-in will say the session ended (AF-02, AF-06)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on(
        'GET',
        protectionPath,
        protectionRefused(401, 'authentication_required'),
      );
      final container = _container(leaks);

      await _restore(container);

      expect(leaks.secureStore.values, isNot(contains(SecureKey.sessionToken)));
      expect(container.read(sessionProvider), const SignedOut());
      expect(
        container.read(sessionRestoreProvider),
        const SessionRestoreSettled(sessionEnded: true),
      );
      expect(container.read(sessionRestoreProvider).holdsStart, isFalse);
    });

    test('Given an unreachable instance '
        'When the restore runs '
        'Then a lost connection holds the start with a retry, the token is '
        'kept, and nobody is signed in — no vault screen (AF-04; AF-03 '
        'needs a verified offline lease, which none can be while the '
        'protocol gate is closed)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks);

      await _restore(container);

      final state = container.read(sessionRestoreProvider);
      expect(state, isA<SessionRestoreFailed>());
      expect((state as SessionRestoreFailed).isConnectionLost, isTrue);
      expect(state.holdsStart, isTrue);
      expect(leaks.secureStore.values[SecureKey.sessionToken], _token);
      expect(container.read(sessionProvider), const SignedOut());
    });

    test('Given an API that answers 503 identity_unavailable '
        'When the restore runs '
        'Then its reason holds the start with a retry, the token kept '
        '(AF-04, FR-DA-06)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on(
        'GET',
        protectionPath,
        protectionRefused(503, 'identity_unavailable'),
      );
      final container = _container(leaks);

      await _restore(container);

      final state = container.read(sessionRestoreProvider);
      expect(state, isA<SessionRestoreFailed>());
      expect((state as SessionRestoreFailed).isConnectionLost, isFalse);
      expect(state.failure.message, 'identity_unavailable');
      expect(leaks.secureStore.values[SecureKey.sessionToken], _token);
    });

    test('Given a restore that failed '
        'When it is retried and the API now accepts the token '
        'Then the session is restored (AF-04)', () async {
      final leaks = LeakRecorder();
      final container = _container(leaks);
      await _restore(container);
      leaks.adapter.on('GET', protectionPath, protectionFound());

      await container.read(sessionRestoreProvider.notifier).retry();

      expect(container.read(sessionProvider), const SignedIn(accountId: null));
      expect(
        container.read(sessionRestoreProvider),
        const SessionRestoreSettled(),
      );
    });

    test('Given a restore in progress '
        'When it is asked to restore again '
        'Then no second verification is made', () async {
      final repository = FakeSessionRepository()
        ..pendingVerification = Completer();
      final container = _container(LeakRecorder(), repository: repository);

      final first = _restore(container);
      await _restore(container);
      repository.pendingVerification!.complete(
        const Success(SessionVerification.protectionFound),
      );
      await first;

      expect(repository.verifications, 1);
    });

    test('Given no adopted instance '
        'When the restore runs '
        'Then there is nothing to verify against and the start is not held '
        '(UC-05 precondition; setup comes first)', () async {
      final repository = FakeSessionRepository();
      final container = _container(
        LeakRecorder(),
        instance: '',
        repository: repository,
      );

      await _restore(container);

      expect(repository.verifications, 0);
      expect(
        container.read(sessionRestoreProvider),
        const SessionRestoreSettled(),
      );
    });

    test('Given a session that ended at start '
        'When the user acknowledges it '
        'Then sign-in no longer says so', () async {
      final repository = FakeSessionRepository()
        ..nextVerification = const Failure(
          message: 'authentication_required',
          kind: FailureKind.unauthenticated,
        );
      final container = _container(LeakRecorder(), repository: repository);
      await _restore(container);

      container.read(sessionRestoreProvider.notifier).acknowledgeSessionEnded();

      expect(
        container.read(sessionRestoreProvider),
        const SessionRestoreSettled(),
      );
    });
  });
}
