/// The second-factor challenge flow's state (UC-04).
///
/// The challenge itself — its reference and methods — lives in the session, in
/// memory, as [ChallengePending] (FR-SE-04). This controller holds only where
/// the submission stands. The code lives in the screen's field and in the one
/// request that carries it; the only secret held here is a token secure
/// storage could not keep, until the user decides whether to continue for
/// this run (UC-03 AF-05, which step 6 inherits).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/result/result.dart';
import '../../../core/session/session_controller.dart';
import '../../../core/session/session_state.dart';
import '../../../core/storage/secure_store.dart';
import '../data/session_repository.dart';

/// Where the challenge screen stands.
@immutable
sealed class ChallengeState {
  const ChallengeState();
}

/// Waiting for the code.
final class ChallengeIdle extends ChallengeState {
  const ChallengeIdle();
}

/// The code is on its way to the API.
final class ChallengeSubmitting extends ChallengeState {
  const ChallengeSubmitting();
}

/// A session exists. The guard routes onward (step 7).
final class ChallengeCompletedState extends ChallengeState {
  const ChallengeCompletedState();
}

/// The API refused the submission (AF-01). [failure]'s message is the API's
/// own. The challenge stays outstanding for another attempt — the API does not
/// yet tell a refused code from an expired challenge (AF-02, System
/// Requirements §5.4) — and the screen offers to repeat the sign-in.
final class ChallengeRefused extends ChallengeState {
  const ChallengeRefused(this.failure);

  final Failure<SignInCompleted> failure;
}

/// The submission was not answered (AF-04). A retry resends it with the same
/// challenge; no session is assumed.
final class ChallengeConnectionLost extends ChallengeState {
  const ChallengeConnectionLost(this.failure);

  final Failure<SignInCompleted> failure;
}

/// The API completed the login but secure storage cannot keep the session
/// (step 6, as UC-03 AF-05). The user may continue for this run with the token
/// in memory.
final class ChallengeSessionNotKept extends ChallengeState {
  const ChallengeSessionNotKept();
}

/// Runs UC-04.
class ChallengeController extends Notifier<ChallengeState> {
  /// The completed login secure storage could not keep, awaiting the user's
  /// decision. Memory only, and never part of [state].
  SignInCompleted? _unkept;

  @override
  ChallengeState build() {
    ref.onDispose(() => _unkept = null);
    return const ChallengeIdle();
  }

  /// Submits [code] with the outstanding challenge (main flow, steps 3–6).
  Future<void> submit(String code) async {
    if (state is ChallengeSubmitting) return;
    final challenge = ref.read(sessionProvider);
    if (challenge is! ChallengePending) return;
    _unkept = null;
    state = const ChallengeSubmitting();

    final result = await ref
        .read(sessionRepositoryProvider)
        .completeChallenge(
          challengeToken: challenge.challengeToken,
          code: code,
        );
    if (!ref.mounted) return;

    // Abandoned while the code was in flight: the user has already left, and
    // nothing the answer carries is kept (AF-03).
    if (ref.read(sessionProvider) != challenge) return;

    switch (result) {
      case Success(:final value):
        await _establish(value);
      case Failure(kind: FailureKind.unreachable) && final failure:
        state = ChallengeConnectionLost(failure);
      case Failure() && final failure:
        state = ChallengeRefused(failure);
    }
  }

  /// Gives up on the challenge and returns to sign-in, so the sign-in can be
  /// repeated (AF-01, AF-02). Nothing was stored, so nothing remains.
  void repeatSignIn() {
    _unkept = null;
    final challenge = ref.read(sessionProvider);
    if (challenge is ChallengePending) {
      ref
          .read(sessionProvider.notifier)
          .abandonChallenge(challenge.challengeToken);
    }
  }

  /// Continues with the token held in memory for this run (step 6, as UC-03
  /// AF-05).
  void continueForThisRun() {
    final unkept = _unkept;
    if (unkept == null) return;
    _unkept = null;
    ref
        .read(sessionProvider.notifier)
        .establishForThisRun(token: unkept.token, accountId: unkept.accountId);
    state = const ChallengeCompletedState();
  }

  /// Declines to continue: the token is discarded, and with it the challenge
  /// the API has already spent, so the user is back at sign-in.
  void discardUnkeptSession() => repeatSignIn();

  Future<void> _establish(SignInCompleted completed) async {
    try {
      await ref
          .read(sessionProvider.notifier)
          .establish(token: completed.token, accountId: completed.accountId);
      if (!ref.mounted) return;
      state = const ChallengeCompletedState();
    } on SecureStoreUnavailableException {
      if (!ref.mounted) return;
      _unkept = completed;
      state = const ChallengeSessionNotKept();
    }
  }
}

/// The challenge flow. Disposed with its screen, taking any unkept token with
/// it.
final challengeControllerProvider =
    NotifierProvider.autoDispose<ChallengeController, ChallengeState>(
      ChallengeController.new,
    );
