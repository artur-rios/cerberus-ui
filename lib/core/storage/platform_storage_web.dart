/// The web's storage: memory only, for both stores (IR-07, FR-OF-16).
///
/// Nothing here touches local storage, session storage, IndexedDB, cookies or
/// the Cache API. Reloading the page forgets everything, which is the point.
library;

import 'preferences_store.dart';
import 'secure_store.dart';

/// The web's secure store: memory.
SecureStore createSecureStore() => MemorySecureStore();

/// The web's preferences store: memory.
PreferencesStore createPreferencesStore() => MemoryPreferencesStore();
