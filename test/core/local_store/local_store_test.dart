import 'package:cerberus_ui/core/local_store/local_store.dart';
import 'package:drift/drift.dart' show Value, driftRuntimeOptions;
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/leak_recorder.dart';
import 'generated/schema.dart';

void main() {
  // The migration test opens a second database next to [store] on purpose.
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  late LocalStore store;

  setUp(() {
    store = LocalStore(NativeDatabase.memory());
    addTearDown(store.close);
  });

  group('LocalStore migrations', () {
    test(
      'Given a fresh device '
      'When the store is created '
      'Then its schema is exactly the v1 snapshot in drift_schemas/',
      () async {
        final verifier = SchemaVerifier(GeneratedHelper());
        final connection = await verifier.startAt(1);
        final migrated = LocalStore(connection);
        addTearDown(migrated.close);

        await verifier.migrateAndValidate(migrated, 1);
      },
    );

    test('Given the store '
        'When its version is read '
        'Then it is the latest snapshotted version', () {
      expect(store.schemaVersion, GeneratedHelper.versions.last);
    });
  });

  group('LocalStore', () {
    test('Given an entity, a lease, a cursor and a pending edit '
        'When they are written and read back '
        'Then each round-trips', () async {
      final editedAt = DateTime.utc(2026, 10, 8, 12);

      await store
          .into(store.storedEntities)
          .insert(
            StoredEntitiesCompanion.insert(
              publicId: 'record-1',
              kind: EntityKind.record,
              envelope: '{"format":"f"}',
              metadata: '{"revision":1}',
            ),
          );
      await store
          .into(store.offlineLeases)
          .insert(
            OfflineLeasesCompanion.insert(
              token: 'jws',
              scope: '{}',
              latestObservedTime: editedAt,
            ),
          );
      await store
          .into(store.syncCursors)
          .insert(SyncCursorsCompanion.insert(cursor: 'c-1'));
      await store
          .into(store.pendingEdits)
          .insert(
            PendingEditsCompanion.insert(
              operationId: 'op-1',
              entityPublicId: 'record-1',
              kind: EditKind.update,
              editedAt: editedAt,
              envelope: const Value('{"format":"f"}'),
            ),
          );

      final entity = await store.select(store.storedEntities).getSingle();
      final lease = await store.select(store.offlineLeases).getSingle();
      final edit = await store.select(store.pendingEdits).getSingle();

      expect(entity.kind, EntityKind.record);
      expect(entity.pending, isFalse);
      expect(lease.id, 1);
      expect(lease.expiresAt, isNull);
      expect(edit.editedAt, editedAt);
    });

    test('Given a second lease '
        'When it is inserted '
        'Then it is refused: there is only ever one lease', () async {
      final now = DateTime.utc(2026);
      final lease = OfflineLeasesCompanion.insert(
        token: 'jws',
        scope: '{}',
        latestObservedTime: now,
      );
      await store.into(store.offlineLeases).insert(lease);

      await expectLater(
        store.into(store.offlineLeases).insert(lease),
        throwsA(isA<SqliteException>()),
      );
    });

    test('Given content written as an envelope '
        'When every row is captured by the leak recorder '
        'Then the recorder sees the rows, so a plaintext marker would be '
        'caught (IR-13)', () async {
      final leaks = LeakRecorder();
      await store
          .into(store.storedEntities)
          .insert(
            StoredEntitiesCompanion.insert(
              publicId: 'record-1',
              kind: EntityKind.record,
              envelope: '{"ciphertext":"CIPHERTEXT-MARKER"}',
              metadata: '{}',
            ),
          );

      await leaks.captureLocalStore(store);

      leaks.expectOnlyIn('CIPHERTEXT-MARKER', {LeakChannel.localStore});
      leaks.expectNoLeak('PLAINTEXT-MARKER');
    });
  });
}
