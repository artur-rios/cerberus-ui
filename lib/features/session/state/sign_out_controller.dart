/// Signing out (UC-06, FR-SE-11, FR-SE-12).
///
/// In the default mode the user first chooses whether to keep the vault on
/// the device — a ciphertext copy — or remove it (step 2), and removing it
/// when offline edits were never uploaded asks again (AF-01). Online only and
/// on the web there is no store and nothing to ask (AF-02). The ending itself
/// is the session's: it locks the vault, deletes the token and discards the
/// in-memory state (steps 3–5); then the store goes if the user chose so (step
/// 6), and the guard presents sign-in (step 7).
///
/// A session the API rejected ends without any of this, through the session
/// controller, keeping the store (AF-04).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/device_settings.dart';
import '../../../core/logging/app_log.dart';
import '../../../core/result/result.dart';
import '../../../core/session/session_controller.dart';
import '../../../core/session/session_notice.dart';
import '../data/device_vault_repository.dart';

/// Where signing out stands.
@immutable
sealed class SignOutState {
  const SignOutState();
}

/// Not signing out.
final class SignOutIdle extends SignOutState {
  const SignOutIdle();

  @override
  bool operator ==(Object other) => other is SignOutIdle;

  @override
  int get hashCode => (SignOutIdle).hashCode;
}

/// Asking whether to keep the vault on this device or remove it (step 2).
final class SignOutChoosingStorage extends SignOutState {
  const SignOutChoosingStorage();

  @override
  bool operator ==(Object other) => other is SignOutChoosingStorage;

  @override
  int get hashCode => (SignOutChoosingStorage).hashCode;
}

/// Asking again, because removing the store loses [pendingEdits] offline
/// edits that were never uploaded (AF-01).
final class SignOutConfirmingLoss extends SignOutState {
  const SignOutConfirmingLoss(this.pendingEdits);

  final int pendingEdits;

  @override
  bool operator ==(Object other) =>
      other is SignOutConfirmingLoss && other.pendingEdits == pendingEdits;

  @override
  int get hashCode => pendingEdits.hashCode;
}

/// Ending the session and, where chosen, removing the store.
final class SignOutInProgress extends SignOutState {
  const SignOutInProgress();

  @override
  bool operator ==(Object other) => other is SignOutInProgress;

  @override
  int get hashCode => (SignOutInProgress).hashCode;
}

/// Runs UC-06.
///
/// Not disposed with the screen that started it: the session ending takes the
/// user to sign-in, and removing the store (step 6) still has to happen after
/// that screen is gone.
class SignOutController extends Notifier<SignOutState> {
  @override
  SignOutState build() => const SignOutIdle();

  /// The user chose to sign out (step 1).
  Future<void> request() async {
    if (state is! SignOutIdle) return;

    // AF-02: online only or on the web, there is no store to ask about.
    final device = ref.read(deviceSettingsProvider);
    if (ref.read(isWebProvider) ||
        device.storageMode != StorageMode.defaultMode) {
      await _complete(removeVault: false);
      return;
    }

    state = const SignOutChoosingStorage();
  }

  /// The user decided not to sign out after all, while asked about the store.
  void cancel() {
    if (state is SignOutChoosingStorage) state = const SignOutIdle();
  }

  /// Keeps the ciphertext store on this device (step 2).
  Future<void> keepVault() async {
    if (state is! SignOutChoosingStorage) return;
    await _complete(removeVault: false);
  }

  /// Removes the store — after asking again when that loses offline edits
  /// (AF-01).
  Future<void> removeVault() async {
    if (state is! SignOutChoosingStorage) return;
    state = const SignOutInProgress();

    final counted = await ref
        .read(deviceVaultRepositoryProvider)
        .pendingEditCount();
    if (!ref.mounted) return;

    switch (counted) {
      case Success(value: > 0 && final pendingEdits):
        state = SignOutConfirmingLoss(pendingEdits);
      case Success():
        await _complete(removeVault: true);
      // The store cannot be read, so what removing it would lose cannot be
      // stated. It is kept — nothing is lost — and sign-in says so.
      case Failure():
        await _complete(removeVault: false, vaultNotRemoved: true);
    }
  }

  /// Removes the store although edits will be lost (AF-01).
  Future<void> confirmRemoval() async {
    if (state is! SignOutConfirmingLoss) return;
    await _complete(removeVault: true);
  }

  /// Declines to lose the edits: the store is kept, and signing out goes on
  /// (AF-01).
  Future<void> declineRemoval() async {
    if (state is! SignOutConfirmingLoss) return;
    await _complete(removeVault: false);
  }

  Future<void> _complete({
    required bool removeVault,
    bool vaultNotRemoved = false,
  }) async {
    state = const SignOutInProgress();

    // Steps 3–5, and step 7 through the guard as soon as the session changes.
    await ref.read(sessionProvider.notifier).end();

    // Step 6.
    var removed = false;
    if (removeVault) {
      final result = await ref.read(deviceVaultRepositoryProvider).remove();
      removed = result is Success;
      vaultNotRemoved = vaultNotRemoved || !removed;
    }
    if (!ref.mounted) return;
    if (vaultNotRemoved) {
      ref
          .read(sessionNoticeProvider.notifier)
          .post(SessionNotice.vaultNotRemoved);
    }

    AppLog.event('session.signed-out', {'vaultRemoved': removed});
    state = const SignOutIdle();
  }
}

/// Signing out.
final signOutControllerProvider =
    NotifierProvider<SignOutController, SignOutState>(SignOutController.new);
