/// `POST /api/auth/login` and `POST /api/auth/2fa/verify` answers, shaped
/// exactly as the API's contract defines them (Testing Specification §2.4): the `DataOutput` envelope, the
/// API's message codes and its status codes (cerberus-api
/// `AuthenticationHandler`, `AuthenticationMessages`).
library;

import 'stub_http_adapter.dart';

/// The login path.
const loginPath = '/api/auth/login';

/// The second-factor challenge path.
const challengePath = '/api/auth/2fa/verify';

/// A completed login: Heimdall's token and the Cerberus account.
StubResponse loginCompleted({
  String token = 'session-token',
  String accountId = '6f1c2a54-0d7e-4a8b-9c3e-1b2d3e4f5a6b',
  Map<String, Object?> extraIdentityFields = const {},
}) => StubResponse(200, {
  'messages': ['authenticated'],
  'errors': <String>[],
  'timestamp': '2026-10-08T12:00:00Z',
  'success': true,
  'data': {
    'identity': {
      'token': token,
      'expiresAt': '2026-10-08T13:00:00Z',
      'emailVerified': true,
      'requiresTwoFactor': false,
      'challengeToken': null,
      'availableMethods': null,
      ...extraIdentityFields,
    },
    'account': {'id': accountId, 'revision': 1},
  },
});

/// A login Heimdall challenged: no token and no account, only the challenge.
StubResponse loginChallenged({
  String challengeToken = 'challenge-token',
  List<String> methods = const ['App'],
}) => StubResponse(200, {
  'messages': ['authentication_challenge_required'],
  'errors': <String>[],
  'timestamp': '2026-10-08T12:00:00Z',
  'success': true,
  'data': {
    'identity': {
      'token': null,
      'expiresAt': null,
      'emailVerified': null,
      'requiresTwoFactor': true,
      'challengeToken': challengeToken,
      'availableMethods': methods,
    },
    'account': null,
  },
});

/// A refusal: [statusCode] with the API's [error] code.
StubResponse loginRefused(int statusCode, String error) =>
    StubResponse(statusCode, {
      'messages': <String>[],
      'errors': [error],
      'timestamp': '2026-10-08T12:00:00Z',
      'success': false,
    });

/// A completed challenge: the same shape as a completed login, because the
/// API completes a challenged login exactly as it completes a direct one.
StubResponse challengeCompleted({
  String token = 'session-token',
  String accountId = '6f1c2a54-0d7e-4a8b-9c3e-1b2d3e4f5a6b',
}) => loginCompleted(token: token, accountId: accountId);

/// A refused challenge submission: a wrong code and an expired, exhausted or
/// redeemed challenge alike, because the API answers them the same way
/// (System Requirements §5.4).
StubResponse challengeRefused() => loginRefused(401, 'authentication_required');
