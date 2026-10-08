/// A hand-written [SessionRepository] fake (Testing Specification §6.2).
library;

import 'dart:async';

import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';

/// Answers each sign-in with [next], recording the email it was asked for,
/// each challenge completion with [nextChallenge], recording the reference
/// and code it was given, and each session verification with
/// [nextVerification], counting them in [verifications].
///
/// Set [pending], [pendingChallenge] or [pendingVerification] to hold the
/// answer until it is completed, which is how a test sees the loading state.
class FakeSessionRepository implements SessionRepository {
  FakeSessionRepository([this.next]);

  Result<SignInOutcome>? next;
  Completer<Result<SignInOutcome>>? pending;
  final List<String> emails = [];

  Result<SignInCompleted>? nextChallenge;
  Completer<Result<SignInCompleted>>? pendingChallenge;
  final List<(String challengeToken, String code)> challenges = [];

  Result<SessionVerification>? nextVerification;
  Completer<Result<SessionVerification>>? pendingVerification;
  int verifications = 0;

  @override
  Future<Result<SessionVerification>> verifySession() {
    verifications++;
    final pending = pendingVerification;
    if (pending != null) return pending.future;
    return Future.value(
      nextVerification ??
          const Failure(
            message: 'No answer set.',
            kind: FailureKind.serverError,
          ),
    );
  }

  @override
  Future<Result<SignInCompleted>> completeChallenge({
    required String challengeToken,
    required String code,
  }) {
    challenges.add((challengeToken, code));
    final pending = pendingChallenge;
    if (pending != null) return pending.future;
    return Future.value(
      nextChallenge ??
          const Failure(
            message: 'No answer set.',
            kind: FailureKind.serverError,
          ),
    );
  }

  @override
  Future<Result<SignInOutcome>> signIn({
    required String email,
    required String password,
  }) {
    emails.add(email);
    final pending = this.pending;
    if (pending != null) return pending.future;
    return Future.value(
      next ??
          const Failure(
            message: 'No answer set.',
            kind: FailureKind.serverError,
          ),
    );
  }
}
