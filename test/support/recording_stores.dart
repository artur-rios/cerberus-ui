/// In-memory stores that record every write (Testing Specification §6.2).
library;

import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';

/// A [SecureStore] in memory, recording each write as `key=value`.
class RecordingSecureStore implements SecureStore {
  final Map<SecureKey, String> values = {};
  final List<String> writes = [];

  /// When set, every operation throws it — platform storage being
  /// unavailable.
  SecureStoreUnavailableException? failure;

  /// When set, only deleting throws it — a store that kept the token but
  /// cannot remove it (UC-06 AF-03).
  SecureStoreUnavailableException? deleteFailure;

  @override
  Future<String?> read(SecureKey key) async {
    _failIfSet();
    return values[key];
  }

  @override
  Future<void> write(SecureKey key, String value) async {
    _failIfSet();
    writes.add('${key.storageKey}=$value');
    values[key] = value;
  }

  @override
  Future<void> delete(SecureKey key) async {
    _failIfSet();
    final deleteFailure = this.deleteFailure;
    if (deleteFailure != null) throw deleteFailure;
    values.remove(key);
  }

  void _failIfSet() {
    final failure = this.failure;
    if (failure != null) throw failure;
  }
}

/// A [PreferencesStore] in memory, recording each write as `key=value`.
class RecordingPreferencesStore implements PreferencesStore {
  final Map<PreferenceKey, String> values = {};
  final List<String> writes = [];

  /// When set, writing throws it — preference storage that cannot be written
  /// (UC-10 AF-04).
  Exception? writeFailure;

  @override
  Future<String?> read(PreferenceKey key) async => values[key];

  @override
  Future<void> write(PreferenceKey key, String value) async {
    final writeFailure = this.writeFailure;
    if (writeFailure != null) throw writeFailure;
    writes.add('${key.storageKey}=$value');
    values[key] = value;
  }

  @override
  Future<void> remove(PreferenceKey key) async => values.remove(key);
}
