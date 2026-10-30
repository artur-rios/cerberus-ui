/// The local store on Windows, Linux and Android: a SQLite file (IR-08).
library;

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import 'local_store.dart';

/// Whether this target can hold a local store.
const localStoreSupported = true;

/// The store's file name, in the application support directory.
const localStoreFileName = 'cerberus_local_store.sqlite';

/// Opens the store, creating it at first use. Queries run on a background
/// isolate so that synchronization never blocks the UI isolate (`NFR-08`).
Future<LocalStore?> openLocalStore() async =>
    LocalStore(NativeDatabase.createInBackground(await _file()));

/// Deletes the store — on a switch to online-only mode (`FR-CF-07`), or when
/// the user removes the vault from the device at sign-out (`FR-SE-12`).
Future<void> deleteLocalStore() async => deleteLocalStoreFile(await _file());

/// How many offline edits the store holds that were never uploaded — what
/// removing it would lose (UC-06 AF-01). None when there is no store.
Future<int> countPendingEdits() async => countPendingEditsIn(await _file());

/// Deletes the store at [file], if there is one.
Future<void> deleteLocalStoreFile(File file) async {
  if (file.existsSync()) await file.delete();
}

/// Counts the pending edits in the store at [file], without creating one where
/// there is none.
Future<int> countPendingEditsIn(File file) async {
  if (!file.existsSync()) return 0;
  final store = LocalStore(NativeDatabase(file));
  try {
    final count = store.pendingEdits.operationId.count();
    final query = store.selectOnly(store.pendingEdits)..addColumns([count]);
    return await query.map((row) => row.read(count) ?? 0).getSingle();
  } finally {
    await store.close();
  }
}

Future<File> _file() async {
  final directory = await getApplicationSupportDirectory();
  return File('${directory.path}${Platform.pathSeparator}$localStoreFileName');
}
