/// Restoring a stored session at start (UC-05, FR-SE-08).
///
/// A token found in secure storage is not a session until the API has
/// accepted it, so until then the guard holds every route on a neutral
/// starting screen (step 2) — no vault, no account detail. The verification
/// itself is the repository's; this decides what each answer means.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/instance_config.dart';
import '../../../core/logging/app_log.dart';
import '../../../core/result/result.dart';
import '../../../core/session/session_controller.dart';
import '../../../core/session/session_token_store.dart';
import '../data/session_repository.dart';

/// Where restoring the stored session stands.
@immutable
sealed class SessionRestoreState {
  const SessionRestoreState();

  /// Whether the guard holds every route on the starting screen.
  bool get holdsStart => false;
}

/// Nothing is being restored: not started, or finished.
final class SessionRestoreSettled extends SessionRestoreState {
  const SessionRestoreSettled({this.sessionEnded = false});

  /// The API rejected the stored session, which was discarded; sign-in says
  /// so until the user acknowledges it or signs in (AF-02).
  final bool sessionEnded;

  @override
  bool operator ==(Object other) =>
      other is SessionRestoreSettled && other.sessionEnded == sessionEnded;

  @override
  int get hashCode => sessionEnded.hashCode;
}

/// The stored token is being verified with the API (steps 2–4).
final class SessionRestoreVerifying extends SessionRestoreState {
  const SessionRestoreVerifying();

  @override
  bool get holdsStart => true;

  @override
  bool operator ==(Object other) => other is SessionRestoreVerifying;

  @override
  int get hashCode => (SessionRestoreVerifying).hashCode;
}

/// The verification did not complete. The token is kept — the API did not
/// reject it — and no vault screen is shown until a retry succeeds (AF-04).
final class SessionRestoreFailed extends SessionRestoreState {
  const SessionRestoreFailed(this.failure);

  final Failure<Object?> failure;

  /// Whether the instance could not be reached, rather than having refused.
  bool get isConnectionLost => failure.kind == FailureKind.unreachable;

  @override
  bool get holdsStart => true;

  @override
  bool operator ==(Object other) =>
      other is SessionRestoreFailed &&
      other.failure.message == failure.message &&
      other.failure.kind == failure.kind;

  @override
  int get hashCode => Object.hash(failure.message, failure.kind);
}

/// Restores the stored session at start.
class SessionRestoreController extends Notifier<SessionRestoreState> {
  @override
  SessionRestoreState build() => const SessionRestoreSettled();

  /// Verifies the stored token, if there is one, and resumes or discards the
  /// session accordingly. Called once at start, and again by a retry.
  Future<void> restore() async {
    if (state is SessionRestoreVerifying) return;

    // UC-05 needs an adopted instance; without one the guard sends the user
    // to setup first, and there is nothing to verify the token against.
    if (ref.read(instanceConfigProvider) == null) {
      state = const SessionRestoreSettled();
      return;
    }

    // Held from the first frame, before any await, so no screen that depends
    // on the session is shown while it is unverified (FR-SE-08).
    state = const SessionRestoreVerifying();

    // AF-01, and AF-05 on the web, where nothing is ever stored.
    final token = await ref.read(sessionTokenStoreProvider).read();
    if (token == null || token.isEmpty) {
      state = const SessionRestoreSettled();
      return;
    }

    final result = await ref.read(sessionRepositoryProvider).verifySession();
    if (!ref.mounted) return;

    switch (result) {
      // Steps 4–6: accepted. The guard routes to unlock or to setup — or to
      // the deep link asked for — as soon as the session changes.
      case Success(:final value):
        ref
            .read(sessionProvider.notifier)
            .restore(
              hasProtection: value == SessionVerification.protectionFound,
            );
        state = const SessionRestoreSettled();

      // AF-02, and AF-06 until the API reports a pending closure distinctly:
      // the token is deleted and sign-in says the session ended.
      case Failure(kind: FailureKind.unauthenticated):
        await ref.read(sessionProvider.notifier).end();
        if (!ref.mounted) return;
        state = const SessionRestoreSettled(sessionEnded: true);
        AppLog.event('session.restore-rejected');

      // AF-04: a lost connection, or any refusal other than of the token, is
      // shown with a retry. AF-03's offline unlock needs a valid offline
      // lease, and none can be relied on while the protocol gate is closed:
      // a lease counts only once its signature is verified (FR-CR-09), which
      // is protocol work (FR-CR-02) that arrives with UC-39.
      case Failure() && final failure:
        state = SessionRestoreFailed(failure);
    }
  }

  /// Retries a verification that did not complete (AF-04).
  Future<void> retry() => restore();

  /// The user has seen that their session ended (AF-02).
  void acknowledgeSessionEnded() {
    if (state case SessionRestoreSettled(sessionEnded: true)) {
      state = const SessionRestoreSettled();
    }
  }
}

/// Restoring the stored session at start.
final sessionRestoreProvider =
    NotifierProvider<SessionRestoreController, SessionRestoreState>(
      SessionRestoreController.new,
    );
