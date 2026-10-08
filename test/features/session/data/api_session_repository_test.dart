import 'dart:convert';

import 'package:cerberus_api_client/export.dart';
import 'package:cerberus_ui/core/network/http_client.dart';
import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/features/session/data/api_session_repository.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/auth_payloads.dart';
import '../../../support/leak_recorder.dart';
import '../../../support/stub_http_adapter.dart';

const _email = 'owner@example.com';
const _password = 'PASSWORD-MARKER';

ApiSessionRepository _repository(StubHttpAdapter adapter) =>
    ApiSessionRepository(
      AuthClient(
        createHttpClient(
          baseUrl: Uri.parse('https://vault.example'),
          readToken: () async => null,
          adapter: adapter,
        ),
      ),
    );

void main() {
  group('ApiSessionRepository', () {
    test('Given credentials the API accepts '
        'When signing in '
        'Then the result is a completed login carrying the token and the '
        'account (UC-03 main flow)', () async {
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginCompleted(token: 'tok', accountId: 'a-1'));

      final result = await _repository(adapter)
          .signIn(email: _email, password: _password);

      final completed = result.valueOrNull! as SignInCompleted;
      expect(completed.token, 'tok');
      expect(completed.accountId, 'a-1');
    });

    test('Given credentials '
        'When signing in '
        'Then they are posted to the login endpoint as the contract names '
        'them, over HTTPS (UC-03 steps 2–3)', () async {
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginCompleted());

      await _repository(adapter).signIn(email: _email, password: _password);

      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.uri.scheme, 'https');
      expect(request.uri.path, loginPath);
      expect(request.body, contains('"email":"$_email"'));
      expect(request.body, contains('"password":"$_password"'));
    });

    test('Given credentials '
        'When signing in '
        'Then the password reaches the login request body and nothing else — '
        'no URL, header, storage or log line (FR-SE-07, FR-PV-02)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on('POST', loginPath, loginCompleted());

      await _repository(leaks.adapter)
          .signIn(email: _email, password: _password);

      leaks.expectOnlyIn(_password, {LeakChannel.request});
      expect(
        '${leaks.adapter.requests.single.uri}',
        isNot(contains(_password)),
      );
    });

    test('Given a sign-in the API challenges '
        'When signing in '
        'Then the result is the challenge with its methods, and no token '
        '(UC-03 AF-02)', () async {
      final adapter = StubHttpAdapter()
        ..on(
          'POST',
          loginPath,
          loginChallenged(challengeToken: 'ch-1', methods: ['App', 'Email']),
        );

      final result = await _repository(adapter)
          .signIn(email: _email, password: _password);

      final challenged = result.valueOrNull! as SignInChallenged;
      expect(challenged.challengeToken, 'ch-1');
      expect(challenged.methods, ['App', 'Email']);
    });

    test('Given credentials the API rejects '
        'When signing in '
        'Then the failure carries the API\'s own generic reason (UC-03 AF-01, '
        'FR-SE-05)', () async {
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginRefused(401, 'authentication_required'));

      final result = await _repository(adapter)
          .signIn(email: _email, password: _password);

      expect(
        result,
        const Failure<SignInOutcome>(
          message: 'authentication_required',
          kind: FailureKind.unauthenticated,
        ),
      );
    });

    for (final (status, error, kind) in [
      (403, 'authentication_forbidden', FailureKind.forbidden),
      (503, 'identity_unavailable', FailureKind.serverError),
      (400, 'validation_failed', FailureKind.invalidInput),
    ]) {
      test('Given the API refuses with $status $error '
          'When signing in '
          'Then the failure carries that reason unchanged (UC-03 AF-04, '
          'FR-DA-06)', () async {
        final adapter = StubHttpAdapter()
          ..on('POST', loginPath, loginRefused(status, error));

        final result = await _repository(adapter)
            .signIn(email: _email, password: _password);

        expect(result, Failure<SignInOutcome>(message: error, kind: kind));
      });
    }

    test('Given an unreachable instance '
        'When signing in '
        'Then the failure is unreachable and no session is assumed '
        '(UC-03 AF-03)', () async {
      final adapter = StubHttpAdapter();

      final result = await _repository(adapter)
          .signIn(email: _email, password: _password);

      expect(result, isA<Failure<SignInOutcome>>());
      expect((result as Failure).kind, FailureKind.unreachable);
    });

    test(
      'Given an answer carrying fields the generated client does not know '
      'When signing in '
      'Then they are ignored and the login completes (UC-03 AF-06)',
      () async {
        final adapter = StubHttpAdapter()
          ..on(
            'POST',
            loginPath,
            loginCompleted(
              token: 'tok',
              extraIdentityFields: {
                'futureField': 'x',
                'nested': {'a': 1},
              },
            ),
          );

        final result = await _repository(adapter)
            .signIn(email: _email, password: _password);

        expect((result.valueOrNull! as SignInCompleted).token, 'tok');
      },
    );

    for (final (name, response) in [
      ('a success with no token', loginCompleted(token: '')),
      (
        'a success with no account',
        const StubResponse(200, {
          'messages': ['authenticated'],
          'errors': <String>[],
          'success': true,
          'data': {
            'identity': {'token': 'tok', 'requiresTwoFactor': false},
          },
        }),
      ),
      ('a challenge with no reference', loginChallenged(challengeToken: '')),
      (
        'a success with no data',
        const StubResponse(200, {'messages': <String>[], 'success': true}),
      ),
    ]) {
      test('Given $name '
          'When signing in '
          'Then it is a failure, never a half-made session', () async {
        final adapter = StubHttpAdapter()..on('POST', loginPath, response);

        final result = await _repository(adapter)
            .signIn(email: _email, password: _password);

        expect(
          result,
          const Failure<SignInOutcome>(
            message: ApiSessionRepository.incompleteAnswer,
            kind: FailureKind.serverError,
          ),
        );
      });
    }

    test('Given an answer the client cannot decode '
        'When signing in '
        'Then it is a failure value rather than a throw (FR-DA-03)', () async {
      final adapter = StubHttpAdapter()
        ..on(
          'POST',
          loginPath,
          const StubResponse(200, {'data': 'not-an-object'}),
        );

      final result = await _repository(adapter)
          .signIn(email: _email, password: _password);

      expect(
        result,
        const Failure<SignInOutcome>(
          message: ApiSessionRepository.unreadableAnswer,
          kind: FailureKind.serverError,
        ),
      );
    });
  });

  group('ApiSessionRepository.completeChallenge', () {
    Future<Result<SignInCompleted>> complete(
      StubHttpAdapter adapter, {
      String challengeToken = 'CHALLENGE-MARKER',
      String code = 'CODE-MARKER',
    }) =>
        _repository(adapter)
            .completeChallenge(challengeToken: challengeToken, code: code);

    test('Given a code the API accepts '
        'When the challenge is completed '
        'Then the result is a completed login carrying the token and the '
        'account (UC-04 main flow, step 5)', () async {
      final adapter = StubHttpAdapter()
        ..on(
          'POST',
          challengePath,
          challengeCompleted(token: 'tok', accountId: 'a-1'),
        );

      final result = await complete(adapter);

      expect(result.valueOrNull!.token, 'tok');
      expect(result.valueOrNull!.accountId, 'a-1');
    });

    test('Given a code '
        'When the challenge is completed '
        'Then the code and the challenge reference are posted to the '
        'challenge endpoint as the contract names them, with no recovery code '
        'and no token (UC-04 step 4)', () async {
      final adapter = StubHttpAdapter()
        ..on('POST', challengePath, challengeCompleted());

      await complete(adapter);

      final request = adapter.requests.single;
      expect(request.method, 'POST');
      expect(request.uri.scheme, 'https');
      expect(request.uri.path, challengePath);
      final body = jsonDecode(request.body) as Map<String, Object?>;
      expect(body['challengeToken'], 'CHALLENGE-MARKER');
      expect(body['code'], 'CODE-MARKER');
      expect(body['recoveryCode'], isNull);
      expect(request.headers, isNot(contains('Authorization')));
    });

    test(
      'Given a code '
      'When the challenge is completed '
      'Then the code and the reference reach the request body and nothing '
      'else — no URL, header, storage or log line (FR-SE-04, FR-PV-02)',
      () async {
        final leaks = LeakRecorder();
        leaks.adapter.on('POST', challengePath, challengeCompleted());

        await complete(leaks.adapter);

        leaks.expectOnlyIn('CODE-MARKER', {LeakChannel.request});
        leaks.expectOnlyIn('CHALLENGE-MARKER', {LeakChannel.request});
        final uri = '${leaks.adapter.requests.single.uri}';
        expect(uri, isNot(contains('CODE-MARKER')));
        expect(uri, isNot(contains('CHALLENGE-MARKER')));
      },
    );

    test('Given a code the API refuses '
        'When the challenge is completed '
        'Then the failure carries the API\'s own reason unchanged — the same '
        'for a wrong code and an expired challenge (UC-04 AF-01, AF-02, '
        'FR-DA-06)', () async {
      final adapter = StubHttpAdapter()
        ..on('POST', challengePath, challengeRefused());

      final result = await complete(adapter);

      expect(
        result,
        const Failure<SignInCompleted>(
          message: 'authentication_required',
          kind: FailureKind.unauthenticated,
        ),
      );
    });

    test('Given an unreachable instance '
        'When the challenge is completed '
        'Then the failure is unreachable and no session is assumed (UC-04 '
        'AF-04)', () async {
      final result = await complete(StubHttpAdapter());

      expect((result as Failure).kind, FailureKind.unreachable);
    });

    for (final (name, response) in [
      ('a second challenge', loginChallenged()),
      ('a success with no token', challengeCompleted(token: '')),
      (
        'a success with no data',
        const StubResponse(200, {'messages': <String>[], 'success': true}),
      ),
    ]) {
      test('Given an answer that is $name '
          'When the challenge is completed '
          'Then it is a failure, never a half-made session', () async {
        final adapter = StubHttpAdapter()..on('POST', challengePath, response);

        final result = await complete(adapter);

        expect(
          result,
          const Failure<SignInCompleted>(
            message: ApiSessionRepository.incompleteAnswer,
            kind: FailureKind.serverError,
          ),
        );
      });
    }

    test('Given an answer the client cannot decode '
        'When the challenge is completed '
        'Then it is a failure value rather than a throw (FR-DA-03)', () async {
      final adapter = StubHttpAdapter()
        ..on(
          'POST',
          challengePath,
          const StubResponse(200, {'data': 'not-an-object'}),
        );

      final result = await complete(adapter);

      expect(
        result,
        const Failure<SignInCompleted>(
          message: ApiSessionRepository.unreadableAnswer,
          kind: FailureKind.serverError,
        ),
      );
    });
  });
}
