/// The local store of the default mode (IR-08, FR-OF-01, FR-OF-02).
///
/// drift over SQLite, on Windows, Linux and Android only. The web build does
/// not contain it: it is opened only through `local_store_opener.dart`, whose
/// web implementation never constructs it.
///
/// A schema change bumps [LocalStore.schemaVersion], adds a migration step and
/// a migration test, and regenerates the schema snapshot in `drift_schemas/`
/// with `dart run drift_dev make-migrations`.
library;

import 'package:drift/drift.dart';

import 'tables.dart';

export 'tables.dart';

part 'local_store.g.dart';

/// The local store.
@DriftDatabase(
  tables: [StoredEntities, OfflineLeases, SyncCursors, PendingEdits],
)
class LocalStore extends _$LocalStore {
  LocalStore(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (migrator) => migrator.createAll(),
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}
