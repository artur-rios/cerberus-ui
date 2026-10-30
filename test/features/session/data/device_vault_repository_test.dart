import 'dart:io';

import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/features/session/data/device_vault_repository.dart';
import 'package:flutter_test/flutter_test.dart';

const _platformFailure = FileSystemException(
  'Cannot delete file',
  '/home/owner/PATH-MARKER/cerberus_local_store.sqlite',
);

void main() {
  group('LocalStoreDeviceVaultRepository', () {
    test('Given a store holding two pending edits '
        'When they are counted '
        'Then the count is two (UC-06 AF-01)', () async {
      final repository = LocalStoreDeviceVaultRepository(count: () async => 2);

      expect(await repository.pendingEditCount(), const Success(2));
    });

    test('Given a store that cannot be read '
        'When its pending edits are counted '
        'Then a device-storage failure names what failed, and carries '
        'nothing of the platform message', () async {
      final repository = LocalStoreDeviceVaultRepository(
        count: () async => throw _platformFailure,
      );

      final result = await repository.pendingEditCount();

      expect(
        result,
        isA<Failure<int>>()
            .having((f) => f.kind, 'kind', FailureKind.deviceStorage)
            .having((f) => f.message, 'message', 'local_store_unreadable'),
      );
      expect((result as Failure<int>).message, isNot(contains('PATH-MARKER')));
    });

    test('Given a store on the device '
        'When it is removed '
        'Then the removal succeeds (FR-SE-12)', () async {
      var deleted = false;
      final repository = LocalStoreDeviceVaultRepository(
        delete: () async => deleted = true,
      );

      final result = await repository.remove();

      expect(result, isA<Success<void>>());
      expect(deleted, isTrue);
    });

    test('Given a store that cannot be deleted '
        'When it is removed '
        'Then a device-storage failure is returned', () async {
      final repository = LocalStoreDeviceVaultRepository(
        delete: () async => throw _platformFailure,
      );

      final result = await repository.remove();

      expect(
        result,
        isA<Failure<void>>()
            .having((f) => f.kind, 'kind', FailureKind.deviceStorage)
            .having((f) => f.message, 'message', 'local_store_not_removed'),
      );
    });
  });
}
