/// The local store on Windows, Linux and Android: a SQLite file (IR-08).
library;

import 'dart:io';

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
Future<void> deleteLocalStore() async {
  final file = await _file();
  if (file.existsSync()) await file.delete();
}

Future<File> _file() async {
  final directory = await getApplicationSupportDirectory();
  return File('${directory.path}${Platform.pathSeparator}$localStoreFileName');
}
