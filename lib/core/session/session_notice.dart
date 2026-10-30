/// What sign-in tells the user about how the last session ended (UC-06).
///
/// A session can end in more ways than the user choosing to: the API can
/// reject its token (UC-05 AF-02, UC-06 AF-04, UC-07 AF-01), and ending it can
/// leave something behind that the user should know about (UC-06 AF-03).
/// These notices outlive the session they describe, and nothing else does:
/// every ending first discards whatever notices an earlier one left (UC-06
/// step 5). They are held in memory only and carry no detail of the session.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Something sign-in says about the session that just ended.
enum SessionNotice {
  /// The API rejected the session's token, so it ended without the user
  /// asking (UC-05 AF-02, UC-06 AF-04).
  sessionEnded,

  /// Secure storage could not delete the token. It is overwritten by the next
  /// sign-in (UC-06 AF-03).
  tokenNotDeleted,

  /// The user chose to remove the vault from this device and it could not be
  /// removed; the ciphertext copy is still there.
  vaultNotRemoved,
}

/// Holds the notices for sign-in to show, in the order they were posted.
class SessionNoticeController extends Notifier<Set<SessionNotice>> {
  @override
  Set<SessionNotice> build() => const {};

  /// Adds [notice]. Posting one already shown is not an error.
  void post(SessionNotice notice) => state = {...state, notice};

  /// The user has read [notice].
  void dismiss(SessionNotice notice) => state = {...state}..remove(notice);

  /// Discards every notice: a new session, or a new ending, makes them stale.
  void clear() {
    if (state.isNotEmpty) state = const {};
  }
}

/// The notices sign-in shows.
final sessionNoticeProvider =
    NotifierProvider<SessionNoticeController, Set<SessionNotice>>(
      SessionNoticeController.new,
    );
