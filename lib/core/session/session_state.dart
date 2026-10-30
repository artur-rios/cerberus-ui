/// The session lifecycle (System Requirements §4.2, §8).
///
/// Three states and no others. A pending challenge grants nothing: until the
/// second factor is accepted the application is, for every purpose but the
/// challenge screen itself, signed out (`FR-SE-04`).
library;

import 'package:flutter/foundation.dart';

/// Where the session stands.
@immutable
sealed class SessionState {
  const SessionState();
}

/// No session. The default, and where every failure of a session ends.
final class SignedOut extends SessionState {
  const SignedOut();

  @override
  bool operator ==(Object other) => other is SignedOut;

  @override
  int get hashCode => (SignedOut).hashCode;
}

/// The API accepted the credentials but asked for a second factor (UC-04).
///
/// The challenge reference lives here, in memory, and nowhere else. It is not
/// a session: nothing is stored and no request carries it as a token.
final class ChallengePending extends SessionState {
  const ChallengePending({required this.challengeToken, required this.methods});

  /// The API's reference for this challenge, submitted with the code.
  final String challengeToken;

  /// The second-factor methods the API offered, as the API named them.
  final List<String> methods;

  @override
  bool operator ==(Object other) =>
      other is ChallengePending &&
      other.challengeToken == challengeToken &&
      listEquals(other.methods, methods);

  @override
  int get hashCode => Object.hash(challengeToken, Object.hashAll(methods));

  // The reference is not printed: a toString is how values reach logs.
  @override
  String toString() => 'ChallengePending(methods: $methods)';
}

/// A session exists. The vault is a separate matter: see `VaultState`.
final class SignedIn extends SessionState {
  const SignedIn({required this.accountId});

  /// The Cerberus account's public identifier, carried opaquely — or `null`
  /// for a session restored at start, whose verification names no account
  /// (UC-05 step 3).
  final String? accountId;

  @override
  bool operator ==(Object other) =>
      other is SignedIn && other.accountId == accountId;

  @override
  int get hashCode => accountId.hashCode;

  @override
  String toString() => 'SignedIn($accountId)';
}
