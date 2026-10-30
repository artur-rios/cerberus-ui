/// The sign-out action and its questions (UC-06).
///
/// Offered wherever a signed-in user is. In the default mode it asks whether
/// to keep the vault on this device, saying that the kept copy is ciphertext
/// only (step 2), and asks again when removing it would lose offline edits
/// (AF-01). Online only and on the web it asks nothing (AF-02).
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/app_localizations.dart';
import '../state/sign_out_controller.dart';

/// Signs the user out.
class SignOutButton extends ConsumerWidget {
  const SignOutButton({super.key});

  static const button = Key('sign-out.button');
  static const storageDialog = Key('sign-out.storage-dialog');
  static const keepButton = Key('sign-out.keep');
  static const removeButton = Key('sign-out.remove');
  static const cancelButton = Key('sign-out.cancel');
  static const lossDialog = Key('sign-out.loss-dialog');
  static const confirmRemovalButton = Key('sign-out.confirm-removal');
  static const declineRemovalButton = Key('sign-out.decline-removal');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    ref.listen(signOutControllerProvider, (previous, next) {
      switch (next) {
        case SignOutChoosingStorage():
          _askAboutStorage(context, ref);
        case SignOutConfirmingLoss(:final pendingEdits):
          _confirmLoss(context, ref, pendingEdits);
        case SignOutIdle() || SignOutInProgress():
          break;
      }
    });
    final busy = ref.watch(signOutControllerProvider) is! SignOutIdle;

    return TextButton.icon(
      key: button,
      onPressed: busy
          ? null
          : ref.read(signOutControllerProvider.notifier).request,
      icon: const Icon(Icons.logout),
      label: Text(l10n.signOutAction),
    );
  }

  Future<void> _askAboutStorage(BuildContext context, WidgetRef ref) async {
    final controller = ref.read(signOutControllerProvider.notifier);
    final choice = await showDialog<_StorageChoice>(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context);
        return AlertDialog(
          key: storageDialog,
          title: Text(l10n.signOutStorageTitle),
          content: Text(l10n.signOutStorageBody),
          actions: [
            TextButton(
              key: cancelButton,
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.signOutCancel),
            ),
            TextButton(
              key: removeButton,
              onPressed: () => Navigator.of(context).pop(_StorageChoice.remove),
              child: Text(l10n.signOutRemoveVault),
            ),
            FilledButton(
              key: keepButton,
              onPressed: () => Navigator.of(context).pop(_StorageChoice.keep),
              child: Text(l10n.signOutKeepVault),
            ),
          ],
        );
      },
    );

    switch (choice) {
      case _StorageChoice.keep:
        await controller.keepVault();
      case _StorageChoice.remove:
        await controller.removeVault();
      case null:
        controller.cancel();
    }
  }

  Future<void> _confirmLoss(
    BuildContext context,
    WidgetRef ref,
    int pendingEdits,
  ) async {
    final controller = ref.read(signOutControllerProvider.notifier);
    final remove = await showDialog<bool>(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context);
        return AlertDialog(
          key: lossDialog,
          title: Text(l10n.signOutLossTitle),
          content: Text(l10n.signOutLossBody(pendingEdits)),
          actions: [
            TextButton(
              key: declineRemovalButton,
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.signOutKeepVault),
            ),
            FilledButton(
              key: confirmRemovalButton,
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.signOutRemoveAnyway),
            ),
          ],
        );
      },
    );

    // Dismissing the question is declining it: nothing is lost by default.
    if (remove ?? false) {
      await controller.confirmRemoval();
    } else {
      await controller.declineRemoval();
    }
  }
}

enum _StorageChoice { keep, remove }
