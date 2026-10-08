/// The sign-in flow's state (UC-03).
///
/// Holds no credential: the email and password live in the screen's fields
/// and in the one request that carries them (FR-SE-07). The only secret it
/// ever holds is a token secure storage could not keep, in memory, until the
/// user decides whether to continue for this run (AF-05).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/result/result.dart';
import '../../../core/session/session_controller.dart';
import '../../../core/storage/secure_store.dart';
import '../data/session_repository.dart';

/// Where the sign-in form stands.
@immutable
sealed class SignInState {
  const SignInState();
}

/// Waiting for the user.
final class SignInIdle extends SignInState {
  const SignInIdle();
}

/// The credentials are on their way to the API.
final class SignInSubmitting extends SignInState {
  const SignInSubmitting();
}

/// A session exists. The guard routes onward (step 7).
final class SignInCompletedState extends SignInState {
  const SignInCompletedState();
}

/// The API asked for a second factor; the session holds the challenge and
/// the screen continues with UC-04 (AF-02).
final class SignInChallengedState extends SignInState {
  const SignInChallengedState();
}

/// The sign-in failed: refused by the API (AF-01, AF-04) or not answered
/// (AF-03). [failure]'s message is the API's own wherever it gave one.
final class SignInFailed extends SignInState {
  const SignInFailed(this.failure);

  final Failure<SignInOutcome> failure;

  /// Whether the instance could not be reached, so a retry is offered.
  bool get isConnectionLost => failure.kind == FailureKind.unreachable;

  /// Whether the API rejected the credentials themselves (AF-01).
  bool get credentialsRejected => failure.kind == FailureKind.unauthenticated;
}

/// The API completed the login but secure storage cannot keep the session
/// (AF-05). The user may continue for this run with the token in memory.
final class SignInSessionNotKept extends SignInState {
  const SignInSessionNotKept();
}

/// Runs UC-03.
class SignInController extends Notifier<SignInState> {
  /// The completed login secure storage could not keep, awaiting the user's
  /// decision. Memory only, and never part of [state].
  SignInCompleted? _unkept;

  @override
  SignInState build() {
    ref.onDispose(() => _unkept = null);
    return const SignInIdle();
  }

  /// Submits the credentials (main flow, steps 2–5).
  Future<void> submit({required String email, required String password}) async {
    if (state is SignInSubmitting) return;
    _unkept = null;
    state = const SignInSubmitting();

    final result = await ref
        .read(sessionRepositoryProvider)
        .signIn(email: email, password: password);
    if (!ref.mounted) return;

    switch (result) {
      case Success(value: SignInCompleted() && final completed):
        await _establish(completed);
      case Success(
        value: SignInChallenged(:final challengeToken, :final methods),
      ):
        ref
            .read(sessionProvider.notifier)
            .challenge(challengeToken: challengeToken, methods: methods);
        state = const SignInChallengedState();
      case Failure() && final failure:
        state = SignInFailed(failure);
    }
  }

  /// Continues with the token held in memory for this run (AF-05).
  void continueForThisRun() {
    final unkept = _unkept;
    if (unkept == null) return;
    _unkept = null;
    ref
        .read(sessionProvider.notifier)
        .establishForThisRun(token: unkept.token, accountId: unkept.accountId);
    state = const SignInCompletedState();
  }

  /// Declines to continue: the token is discarded and nothing is kept.
  void discardUnkeptSession() {
    _unkept = null;
    state = const SignInIdle();
  }

  Future<void> _establish(SignInCompleted completed) async {
    try {
      await ref
          .read(sessionProvider.notifier)
          .establish(token: completed.token, accountId: completed.accountId);
      if (!ref.mounted) return;
      state = const SignInCompletedState();
    } on SecureStoreUnavailableException {
      if (!ref.mounted) return;
      _unkept = completed;
      state = const SignInSessionNotKept();
    }
  }
}

/// The sign-in flow. Disposed with its screen, taking any unkept token with
/// it.
final signInControllerProvider =
    NotifierProvider.autoDispose<SignInController, SignInState>(
      SignInController.new,
    );
