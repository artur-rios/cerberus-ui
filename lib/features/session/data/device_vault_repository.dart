/// The vault copy this device keeps, as a whole (FR-SE-12, UC-06 AF-01).
///
/// What sign-out decides about the local store without reading what it holds:
/// how many offline edits removing it would lose, and removing it. Reading
/// and writing its contents is synchronization's (UC-40 … UC-42).
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/local_store/local_store_opener.dart';
import '../../../core/result/result.dart';

/// The local store on this device.
abstract interface class DeviceVaultRepository {
  /// How many offline edits were never uploaded: none when there is no store,
  /// and always none on the web, which has no store.
  Future<Result<int>> pendingEditCount();

  /// Deletes the store. Not a failure when there is none.
  Future<Result<void>> remove();
}

/// The store this target opens: a file on Windows, Linux and Android, and
/// nothing on the web.
class LocalStoreDeviceVaultRepository implements DeviceVaultRepository {
  /// Over this target's store; [count] and [delete] replace it in tests.
  const LocalStoreDeviceVaultRepository({
    this.count = countPendingEdits,
    this.delete = deleteLocalStore,
  });

  /// Counts the store's pending edits.
  final Future<int> Function() count;

  /// Deletes the store.
  final Future<void> Function() delete;

  @override
  Future<Result<int>> pendingEditCount() =>
      _guard(count, 'local_store_unreadable');

  @override
  Future<Result<void>> remove() => _guard(delete, 'local_store_not_removed');

  /// Turns the platform's failure into a [Failure], naming what failed and
  /// carrying nothing from the platform's message — which may name a path.
  Future<Result<T>> _guard<T>(
    Future<T> Function() operation,
    String message,
  ) async {
    try {
      return Success(await operation());
    } on Exception {
      return Failure(message: message, kind: FailureKind.deviceStorage);
    }
  }
}

/// The vault copy on this device. Overridden in tests.
final deviceVaultRepositoryProvider = Provider<DeviceVaultRepository>(
  (ref) => const LocalStoreDeviceVaultRepository(),
);
