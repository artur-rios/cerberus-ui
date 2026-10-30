/// Secure storage (IR-07, FR-SE-06).
///
/// The session token is written **here and nowhere else** — not in
/// preferences, not in a URL, not in the local store. The keys are an enum, so
/// nothing reaches secure storage under an ad-hoc name, and the preferences
/// store has no key a token could be written under.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'platform_storage.dart';

/// What secure storage holds. Only the session token, today.
enum SecureKey {
  sessionToken('cerberus.session.token');

  const SecureKey(this.storageKey);

  /// The name the platform store files the value under.
  final String storageKey;
}

/// Raised when the platform's secure storage cannot be used — no keyring on a
/// Linux desktop, for instance. The caller decides what that means; it never
/// falls back to preferences or a file (UC-03 AF-05).
class SecureStoreUnavailableException implements Exception {
  const SecureStoreUnavailableException(this.reason);

  /// The platform's own description. Never carries the value being stored.
  final String reason;

  @override
  String toString() => 'SecureStoreUnavailableException($reason)';
}

/// Reads and writes secrets that must outlive a run on desktop and Android.
///
/// An interface so that the web and tests substitute an in-memory store, and
/// nothing above `core/storage` imports a storage package (IR-12).
abstract interface class SecureStore {
  /// The stored value, or `null` when none is stored.
  Future<String?> read(SecureKey key);

  /// Stores [value] under [key], replacing any previous one.
  Future<void> write(SecureKey key, String value);

  /// Removes [key]. Removing an absent key is not an error.
  Future<void> delete(SecureKey key);
}

/// Holds secrets in memory for the life of the process.
///
/// The web's implementation (`FR-SE-06`, `FR-OF-16`): reloading the page ends
/// the session because nothing was ever written to the browser. It is also
/// what a desktop run falls back to, for that run only, when the platform
/// store is unavailable.
class MemorySecureStore implements SecureStore {
  final Map<SecureKey, String> _values = {};

  @override
  Future<String?> read(SecureKey key) async => _values[key];

  @override
  Future<void> write(SecureKey key, String value) async => _values[key] = value;

  @override
  Future<void> delete(SecureKey key) async => _values.remove(key);
}

/// The secure store for this target: the platform's on Windows, Linux and
/// Android, memory on the web. Overridden in tests.
final secureStoreProvider = Provider<SecureStore>((ref) => createSecureStore());
