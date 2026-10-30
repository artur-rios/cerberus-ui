/// The web has no local store (FR-OF-15, FR-OF-16).
library;

import 'local_store.dart';

/// Whether this target can hold a local store.
const localStoreSupported = false;

/// Always `null`: the web persists nothing.
Future<LocalStore?> openLocalStore() async => null;

/// Nothing to delete on the web.
Future<void> deleteLocalStore() async {}

/// The web holds no edits.
Future<int> countPendingEdits() async => 0;
