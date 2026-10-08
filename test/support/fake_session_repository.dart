/// A hand-written [SessionRepository] fake (Testing Specification §6.2).
library;

import 'dart:async';

import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';

/// Answers each sign-in with [next], recording the email it was asked for.
///
/// Set [pending] to hold the answer until it is completed, which is how a
/// test sees the loading state.
class FakeSessionRepository implements SessionRepository {
  FakeSessionRepository([this.next]);

  Result<SignInOutcome>? next;
  Completer<Result<SignInOutcome>>? pending;
  final List<String> emails = [];

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
