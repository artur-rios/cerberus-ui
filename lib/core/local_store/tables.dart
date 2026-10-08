/// The local store's schema (System Requirements §4.6 – §4.8).
///
/// **Ciphertext only.** Every content column holds an envelope exactly as the
/// API holds it; what is not an envelope is metadata the API's own database
/// already holds in the clear. A copy of this store reveals what a copy of the
/// server's database would, and nothing more (Technology Stack §4).
library;

import 'package:drift/drift.dart';

/// What a stored entity is.
enum EntityKind { profile, folder, record, collection }

/// What a pending edit does.
enum EditKind { create, update, delete, move }

/// A profile, folder, record or collection, as ciphertext plus metadata.
class StoredEntities extends Table {
  /// The API's public identifier, or one generated offline for a creation.
  TextColumn get publicId => text()();

  TextColumn get kind => textEnum<EntityKind>()();

  /// The encrypted envelope, as the API's JSON. Never plaintext.
  TextColumn get envelope => text()();

  /// Server-visible metadata, as JSON: parent folder, memberships,
  /// associations, revision, edit time, sequence.
  TextColumn get metadata => text()();

  /// Whether a local edit to this entity has not been uploaded yet.
  BoolColumn get pending => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>> get primaryKey => {publicId};
}

/// The offline lease that bounds offline use. At most one row.
class OfflineLeases extends Table {
  /// Always 1: there is only ever one lease, replaced on renewal. A lone
  /// integer primary key is SQLite's rowid, which ignores a default, so the
  /// check is what refuses a second row.
  // drift's documented form for a check on its own column.
  // ignore: recursive_getters
  IntColumn get id => integer().check(id.equals(1))();

  /// The ES256 JWS, verified before use (`FR-CR-09`).
  TextColumn get token => text()();

  /// The profile and grant identifiers the lease covers, as JSON.
  TextColumn get scope => text()();

  /// When the lease expires; `null` only when renewal is disabled.
  DateTimeColumn get expiresAt => dateTime().nullable()();

  /// The latest time this device has observed — the clock-rollback guard.
  DateTimeColumn get latestObservedTime => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// Where synchronization continues from. At most one row.
class SyncCursors extends Table {
  /// Always 1: there is only ever one cursor, replaced as it advances. A lone
  /// integer primary key is SQLite's rowid, which ignores a default, so the
  /// check is what refuses a second row.
  // drift's documented form for a check on its own column.
  // ignore: recursive_getters
  IntColumn get id => integer().check(id.equals(1))();

  /// The API's opaque change cursor.
  TextColumn get cursor => text()();

  @override
  Set<Column<Object>> get primaryKey => {id};
}

/// The outbox: edits made offline, waiting to be uploaded.
class PendingEdits extends Table {
  /// Makes the upload idempotent.
  TextColumn get operationId => text()();

  /// The entity edited — generated on the device for a creation.
  TextColumn get entityPublicId => text()();

  TextColumn get kind => textEnum<EditKind>()();

  /// The encrypted envelope, for a content change. Never plaintext.
  TextColumn get envelope => text().nullable()();

  /// When the edit was made, in UTC — the latest-edit comparison input.
  DateTimeColumn get editedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => {operationId};
}
