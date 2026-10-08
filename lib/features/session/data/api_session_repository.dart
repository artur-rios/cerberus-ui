/// [SessionRepository] over the generated API client (FR-DA-01, FR-DA-02).
library;

import 'package:cerberus_api_client/export.dart';
import 'package:dio/dio.dart';

import '../../../core/logging/app_log.dart';
import '../../../core/network/api_failure.dart';
import '../../../core/result/result.dart';
import 'session_repository.dart';

/// Signs in through `POST /api/auth/login`, and completes a second-factor
/// challenge through `POST /api/auth/2fa/verify` (API UC-02, AF-04).
class ApiSessionRepository implements SessionRepository {
  ApiSessionRepository(this._client);

  final AuthClient _client;

  /// Stated when the API answered success without what a success carries —
  /// there is no API reason to show, because the API gave none.
  static const incompleteAnswer =
      'The instance answered the sign-in without a session.';

  /// Stated when the answer could not be read at all.
  static const unreadableAnswer =
      'The instance sent an answer Cerberus could not read.';

  @override
  Future<Result<SignInOutcome>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final output = await _client.postApiAuthLogin(
        body: LoginCommand(email: email, password: password),
      );
      return _outcome(output.data);
    } on DioException catch (exception) {
      final failure = failureFromDioException<SignInOutcome>(exception);
      AppLog.event('sign-in.refused', {'kind': failure.kind.name});
      return failure;
    } on Object {
      // A response the generated client could not decode. Unknown fields are
      // ignored by the client itself (UC-03 AF-06); this is a malformed one.
      AppLog.event('sign-in.unreadable');
      return const Failure(
        message: unreadableAnswer,
        kind: FailureKind.serverError,
      );
    }
  }

  @override
  Future<Result<SignInCompleted>> completeChallenge({
    required String challengeToken,
    required String code,
  }) async {
    try {
      final output = await _client.postApiAuth2faVerify(
        body: VerifyChallengeCommand(
          challengeToken: challengeToken,
          code: code,
        ),
      );
      // A completed challenge is a completed login and nothing else: a second
      // challenge is not something the endpoint answers with.
      return switch (_outcome(output.data, 'challenge.incomplete')) {
        Success(value: SignInCompleted() && final completed) => Success(
          completed,
        ),
        Success() => _incomplete('challenge.incomplete'),
        Failure(:final message, :final kind) => Failure(
          message: message,
          kind: kind,
        ),
      };
    } on DioException catch (exception) {
      final failure = failureFromDioException<SignInCompleted>(exception);
      AppLog.event('challenge.refused', {'kind': failure.kind.name});
      return failure;
    } on Object {
      AppLog.event('challenge.unreadable');
      return const Failure(
        message: unreadableAnswer,
        kind: FailureKind.serverError,
      );
    }
  }

  static Failure<SignInCompleted> _incomplete(String event) {
    AppLog.event(event);
    return const Failure(
      message: incompleteAnswer,
      kind: FailureKind.serverError,
    );
  }

  /// Reads a completed login or a pending challenge out of [output].
  Result<SignInOutcome> _outcome(
    AuthenticationOutput? output, [
    String incompleteEvent = 'sign-in.incomplete',
  ]) {
    final identity = output?.identity;

    if (identity != null && identity.requiresTwoFactor == true) {
      final challengeToken = identity.challengeToken;
      if (challengeToken != null && challengeToken.isNotEmpty) {
        return Success(
          SignInChallenged(
            challengeToken: challengeToken,
            methods: List.unmodifiable(identity.availableMethods ?? const []),
          ),
        );
      }
    } else {
      final token = identity?.token;
      final accountId = output?.account?.id;
      if (token != null && token.isNotEmpty && accountId != null) {
        return Success(SignInCompleted(token: token, accountId: accountId));
      }
    }

    AppLog.event(incompleteEvent);
    return const Failure(
      message: incompleteAnswer,
      kind: FailureKind.serverError,
    );
  }
}
