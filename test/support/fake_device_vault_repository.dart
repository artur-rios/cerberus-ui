/// A [DeviceVaultRepository] in memory (Testing Specification §6.2).
library;

import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/features/session/data/device_vault_repository.dart';

/// Holds a pretend store, counts its pending edits and records removals.
class FakeDeviceVaultRepository implements DeviceVaultRepository {
  FakeDeviceVaultRepository({this.exists = true, this.pendingEdits = 0});

  /// Whether the device holds a store.
  bool exists;

  /// The offline edits the store holds that were never uploaded.
  int pendingEdits;

  /// How many times the store was removed.
  int removals = 0;

  /// When set, counting the pending edits fails.
  bool countFails = false;

  /// When set, removing the store fails.
  bool removeFails = false;

  @override
  Future<Result<int>> pendingEditCount() async => countFails
      ? const Failure(
          message: 'local_store_unreadable',
          kind: FailureKind.deviceStorage,
        )
      : Success(exists ? pendingEdits : 0);

  @override
  Future<Result<void>> remove() async {
    if (removeFails) {
      return const Failure(
        message: 'local_store_not_removed',
        kind: FailureKind.deviceStorage,
      );
    }
    removals++;
    exists = false;
    pendingEdits = 0;
    return const Success(null);
  }
}
