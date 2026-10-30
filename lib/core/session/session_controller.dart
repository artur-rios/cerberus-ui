/// The session and vault lock providers (Operations & Infrastructure §2.1).
///
/// The transitions every session use case builds on: a challenge, a session
/// established with its token kept in secure storage, a stored session
/// restored at start, and an ending that clears the token and locks the vault
/// (`FR-SE-06`, `FR-SE-08`, `FR-SE-11`). The screens that drive them are
/// UC-03 … UC-06's.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logging/app_log.dart';
import 'session_notice.dart';
import 'session_state.dart';
import 'session_token_store.dart';
import 'vault_state.dart';

/// Holds the session.
class SessionController extends Notifier<SessionState> {
  @override
  SessionState build() => const SignedOut();

  /// Records an outstanding second-factor challenge. Nothing is stored and no
  /// access is granted (`FR-SE-04`).
  void challenge({
    required String challengeToken,
    required List<String> methods,
  }) {
    state = ChallengePending(
      challengeToken: challengeToken,
      methods: List.unmodifiable(methods),
    );
  }

  /// Discards the outstanding challenge whose reference is [challengeToken],
  /// leaving the application signed out (UC-04 AF-01, AF-02, AF-03). Nothing
  /// was stored for it, so there is nothing to delete. A no-op when that
  /// challenge is no longer the one outstanding — completed, already
  /// discarded, or replaced by a later sign-in.
  void abandonChallenge(String challengeToken) {
    if (!ref.mounted) return;
    final current = state;
    if (current is! ChallengePending ||
        current.challengeToken != challengeToken) {
      return;
    }
    state = const SignedOut();
    AppLog.event('challenge.abandoned');
  }

  /// Establishes a session: the token goes to secure storage — memory on the
  /// web — and the vault stays locked, because signing in never unlocks it.
  ///
  /// Throws `SecureStoreUnavailableException`, leaving the state unchanged,
  /// when the platform cannot keep the token (UC-03 AF-05).
  Future<void> establish({
    required String token,
    required String accountId,
  }) async {
    await ref.read(sessionTokenStoreProvider).keep(token);
    _signIn(accountId);
  }

  /// Establishes a session whose token is held in memory for this run only,
  /// after the user accepted that secure storage could not keep it (UC-03
  /// AF-05). Nothing is written anywhere.
  void establishForThisRun({required String token, required String accountId}) {
    ref.read(sessionTokenStoreProvider).holdForThisRun(token);
    _signIn(accountId);
  }

  /// Resumes the stored session the API has just accepted (UC-05 step 5).
  /// Nothing is written: the token is already where it belongs. The vault is
  /// locked, and records whether the account has vault protection to unlock —
  /// or none, so that it has to be set up (UC-12).
  void restore({required bool hasProtection}) {
    ref
        .read(vaultStateProvider.notifier)
        .recordProtection(exists: hasProtection);
    ref.read(sessionNoticeProvider.notifier).clear();
    state = const SignedIn(accountId: null);
    AppLog.event('session.restored', {'protection': hasProtection});
  }

  void _signIn(String accountId) {
    ref.read(vaultStateProvider.notifier).lock();
    ref.read(sessionNoticeProvider.notifier).clear();
    state = SignedIn(accountId: accountId);
    AppLog.event('session.established');
  }

  /// Ends the session (UC-06 steps 3–5, `FR-SE-09`, `FR-SE-11`): the vault
  /// locks, the token is deleted, and the in-memory state goes — the session,
  /// and the notices an earlier ending left. The guard then presents sign-in
  /// (step 7). Safe to call when already signed out.
  ///
  /// [cause] says whether the user asked, or the API rejected the token, in
  /// which case sign-in says that the session ended (UC-06 AF-04). A token
  /// secure storage cannot delete is reported the same way, and the rest of
  /// the ending still happens (AF-03).
  Future<void> end({SessionEndCause cause = SessionEndCause.signOut}) async {
    final notices = ref.read(sessionNoticeProvider.notifier)..clear();
    ref.read(vaultStateProvider.notifier).reset();
    state = const SignedOut();
    if (cause == SessionEndCause.tokenRejected) {
      notices.post(SessionNotice.sessionEnded);
    }

    final deleted = await ref.read(sessionTokenStoreProvider).clear();
    if (!deleted && ref.mounted) {
      ref
          .read(sessionNoticeProvider.notifier)
          .post(SessionNotice.tokenNotDeleted);
    }
    AppLog.event('session.ended', {
      'cause': cause.name,
      'tokenDeleted': deleted,
    });
  }
}

/// Why a session ends.
enum SessionEndCause {
  /// The user signed out (UC-06).
  signOut,

  /// The API rejected the token (UC-05 AF-02, UC-06 AF-04, UC-07 AF-01).
  tokenRejected,
}

/// The session.
final sessionProvider = NotifierProvider<SessionController, SessionState>(
  SessionController.new,
);

/// Holds the vault lock state. Unlocking is UC-13's, behind the protocol gate.
class VaultStateController extends Notifier<VaultState> {
  @override
  VaultState build() => const VaultLocked();

  /// Locks the vault. Locking an already-locked vault is not an error, and an
  /// account with no protection stays that way.
  void lock() {
    if (state is VaultUnlocked) state = const VaultLocked();
  }

  /// Records whether the account has vault protection, as the API reported it
  /// for a restored session (UC-05 step 5): locked when it has, and awaiting
  /// setup (UC-12) when it has none.
  void recordProtection({required bool exists}) => state = exists
      ? const VaultLocked()
      : const VaultProtectionUninitialized();

  /// Locks the vault and forgets what was known about the account's
  /// protection, which belonged to the session that ended.
  void reset() => state = const VaultLocked();
}

/// The vault lock state.
final vaultStateProvider = NotifierProvider<VaultStateController, VaultState>(
  VaultStateController.new,
);
