/// [SessionRepository] over the generated API clients (FR-DA-01, FR-DA-02).
library;

import 'package:cerberus_api_client/export.dart';
import 'package:dio/dio.dart';

import '../../../core/logging/app_log.dart';
import '../../../core/network/api_failure.dart';
import '../../../core/result/result.dart';
import 'session_repository.dart';

/// Signs in through `POST /api/auth/login`, completes a second-factor
/// challenge through `POST /api/auth/2fa/verify` (API UC-02, AF-04), and
/// verifies a stored session through `GET /api/vault/protection` (API UC-38).
class ApiSessionRepository implements SessionRepository {
  ApiSessionRepository(this._client, this._vault);

  /// Over the generated clients of one configured `dio` instance.
  ApiSessionRepository.over(Dio dio) : this(AuthClient(dio), VaultClient(dio));

  final AuthClient _client;
  final VaultClient _vault;

  /// Stated when the API answered success without what a success carries —
  /// there is no API reason to show, because the API gave none.
  static const incompleteAnswer =
      'The instance answered the sign-in without a session.';

  /// The code the API answers with when it holds no protection for the
  /// account, or no active account (API UC-38).
  static const notFoundCode = 'not_found';

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

  @override
  Future<Result<SessionVerification>> verifySession() async {
    try {
      // Only the outcome is read. The answer's body is protection material —
      // protocol material, which nothing here may interpret, keep or log — so
      // it is left with the generated client and dropped with this frame.
      await _vault.getApiVaultProtection();
      AppLog.event('session.verified', {'protection': true});
      return const Success(SessionVerification.protectionFound);
    } on DioException catch (exception) {
      if (exception.response?.statusCode == 404 &&
          errorCodesFromResponse(exception.response?.data)
              .contains(notFoundCode)) {
        AppLog.event('session.verified', {'protection': false});
        return const Success(SessionVerification.protectionNotFound);
      }
      final failure = failureFromDioException<SessionVerification>(exception);
      // Only a stated token rejection ends the stored session (AF-02). Any
      // other 401 is the API refusing for some other reason, kept as a refusal
      // with its own words.
      final kind = isTokenRejection(exception)
          ? FailureKind.unauthenticated
          : failure.kind == FailureKind.unauthenticated
          ? FailureKind.forbidden
          : failure.kind;
      AppLog.event('session.verification-failed', {'kind': kind.name});
      return Failure(message: failure.message, kind: kind);
    } on Object {
      // The status said the protection was found, but the body could not be
      // decoded. The token may well be fine; the answer is not one to act on.
      AppLog.event('session.verification-unreadable');
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
