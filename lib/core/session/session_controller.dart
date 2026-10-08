/// The session and vault lock providers (Operations & Infrastructure §2.1).
///
/// The transitions every session use case builds on: a challenge, a session
/// established with its token kept in secure storage, and an ending that
/// clears the token and locks the vault (`FR-SE-06`, `FR-SE-11`). The screens
/// that drive them are UC-03 … UC-06's.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logging/app_log.dart';
import '../storage/secure_store.dart';
import 'session_state.dart';
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

  /// Establishes a session: the token goes to secure storage — memory on the
  /// web — and the vault stays locked, because signing in never unlocks it.
  Future<void> establish({
    required String token,
    required String accountId,
  }) async {
    await ref.read(secureStoreProvider).write(SecureKey.sessionToken, token);
    ref.read(vaultStateProvider.notifier).lock();
    state = SignedIn(accountId: accountId);
    AppLog.event('session.established');
  }

  /// Ends the session: the vault locks, the token is deleted, and the state is
  /// signed out. Used for sign-out and for a token the API rejected
  /// (`FR-SE-09`, `FR-SE-11`). Safe to call when already signed out.
  Future<void> end() async {
    ref.read(vaultStateProvider.notifier).lock();
    state = const SignedOut();
    await ref.read(secureStoreProvider).delete(SecureKey.sessionToken);
    AppLog.event('session.ended');
  }
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
}

/// The vault lock state.
final vaultStateProvider = NotifierProvider<VaultStateController, VaultState>(
  VaultStateController.new,
);
