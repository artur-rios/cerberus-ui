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

/// Signs a user in through the Cerberus API (FR-SE-02).
abstract interface class SessionRepository {
  /// Submits [email] and [password]. The credentials are held only for the
  /// request that carries them (FR-SE-07).
  Future<Result<SignInOutcome>> signIn({
    required String email,
    required String password,
  });
}

/// The session repository, over the generated API client.
final sessionRepositoryProvider = Provider<SessionRepository>(
  (ref) => ApiSessionRepository(ref.watch(authClientProvider)),
);
