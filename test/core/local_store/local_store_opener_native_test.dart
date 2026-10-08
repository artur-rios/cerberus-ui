import 'dart:io';

import 'package:cerberus_ui/core/local_store/local_store.dart';
import 'package:cerberus_ui/core/local_store/local_store_opener_native.dart';
import 'package:drift/drift.dart' show driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

/// A store file in a fresh temporary directory, removed after the test.
File _storeFile() {
  final directory = Directory.systemTemp.createTempSync('cerberus-store-');
  addTearDown(() => directory.deleteSync(recursive: true));
  return File('${directory.path}${Platform.pathSeparator}$localStoreFileName');
}

/// Creates the store at [file] holding [pendingEdits] edits never uploaded.
Future<void> _seed(File file, {required int pendingEdits}) async {
  final store = LocalStore(NativeDatabase(file));
  for (var i = 0; i < pendingEdits; i++) {
    await store
        .into(store.pendingEdits)
        .insert(
          PendingEditsCompanion.insert(
            operationId: 'op-$i',
            entityPublicId: 'record-$i',
            kind: EditKind.update,
            editedAt: DateTime.utc(2026, 10, 8),
          ),
        );
  }
  await store.close();
}

void main() {
  // Each test opens its own store file, one after another.
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('countPendingEditsIn', () {
    test('Given no store on the device '
        'When the pending edits are counted '
        'Then there are none, and no store is created by counting', () async {
      final file = _storeFile();

      final count = await countPendingEditsIn(file);

      expect(count, 0);
      expect(file.existsSync(), isFalse);
    });

    test('Given a store holding two edits never uploaded '
        'When the pending edits are counted '
        'Then the count is two (UC-06 AF-01)', () async {
      final file = _storeFile();
      await _seed(file, pendingEdits: 2);

      final count = await countPendingEditsIn(file);

      expect(count, 2);
    });

    test('Given a store with nothing pending '
        'When the pending edits are counted '
        'Then there are none', () async {
      final file = _storeFile();
      await _seed(file, pendingEdits: 0);

      expect(await countPendingEditsIn(file), 0);
    });
  });

  group('deleteLocalStoreFile', () {
    test('Given a store on the device '
        'When it is deleted '
        'Then the file is gone (FR-SE-12)', () async {
      final file = _storeFile();
      await _seed(file, pendingEdits: 1);

      await deleteLocalStoreFile(file);

      expect(file.existsSync(), isFalse);
    });

    test('Given no store on the device '
        'When it is deleted '
        'Then it is not an error', () async {
      final file = _storeFile();

      await deleteLocalStoreFile(file);

      expect(file.existsSync(), isFalse);
    });
  });
}
