/// The session feature's repository (FR-DA-01, FR-DA-03).
///
/// Screens and providers reach the API's sign-in only through this interface;
/// none of them touches `dio` or a generated client. Every operation returns a
/// result value and never throws.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/api_clients.dart';
import '../../../core/result/result.dart';
import 'api_session_repository.dart';

/// What a sign-in the API accepted turned into.
@immutable
sealed class SignInOutcome {
  const SignInOutcome();
}

/// The API completed the login: a session token and the Cerberus account.
final class SignInCompleted extends SignInOutcome {
  const SignInCompleted({required this.token, required this.accountId});

  /// Goes to secure storage and nowhere else (FR-SE-06).
  final String token;

  /// The account's public identifier, carried opaquely.
  final String accountId;

  // The token is not printed: a toString is how values reach logs.
  @override
  String toString() => 'SignInCompleted($accountId)';
}

/// The API accepted the credentials but asked for a second factor (UC-03
/// AF-02). Nothing is granted until UC-04 completes it.
final class SignInChallenged extends SignInOutcome {
  const SignInChallenged({required this.challengeToken, required this.methods});

  /// The API's reference for the challenge, held in memory only.
  final String challengeToken;

  /// The second-factor methods the API offered, as the API named them.
  final List<String> methods;

  @override
  String toString() => 'SignInChallenged(methods: $methods)';
}

/// What verifying a stored session found (UC-05 steps 3–5). Either way the
/// API accepted the token; the protection material it may have sent is
/// protocol material and is not part of this — it was discarded unread.
enum SessionVerification {
  /// The account has vault protection, so the vault waits to be unlocked.
  protectionFound,

  /// The API found no protection — or no active account, which it does not
  /// tell apart — so the vault waits to be set up (UC-12).
  protectionNotFound,
}

/// Signs a user in through the Cerberus API (FR-SE-02, FR-SE-03), and
/// verifies a stored session with it (FR-SE-08).
abstract interface class SessionRepository {
  /// Submits [email] and [password]. The credentials are held only for the
  /// request that carries them (FR-SE-07).
  Future<Result<SignInOutcome>> signIn({
    required String email,
    required String password,
  });

  /// Submits the second-factor [code] for the challenge [challengeToken]
  /// through the API's challenge endpoint (UC-04 step 4). The code and the
  /// reference are held only for the request that carries them.
  Future<Result<SignInCompleted>> completeChallenge({
    required String challengeToken,
    required String code,
  });

  /// Asks the API whether the stored session's token is still accepted, by
  /// requesting the account's vault protection with it (UC-05 step 3). A
  /// rejected token is a failure of kind [FailureKind.unauthenticated] (AF-02);
  /// an instance that cannot be reached is one of kind
  /// [FailureKind.unreachable] (AF-04).
  Future<Result<SessionVerification>> verifySession();
}

/// The session repository, over the generated API client.
final sessionRepositoryProvider = Provider<SessionRepository>(
  (ref) => ApiSessionRepository(
    ref.watch(authClientProvider),
    ref.watch(vaultClientProvider),
  ),
);
