/// Preference storage (IR-07, FR-CF-09, FR-PS-04).
///
/// Device settings and presentation choices only. **Never a token, a
/// credential or vault content** — those are secure storage's or memory's, and
/// the separation is the point of having two stores. The keys are an enum, and
/// none of them is a place a secret could be written.
library;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'platform_storage.dart';

/// Everything this application keeps in preferences.
enum PreferenceKey {
  /// The adopted instance address (UC-01).
  instanceAddress('cerberus.config.instanceAddress'),

  /// The device's storage mode (UC-37).
  storageMode('cerberus.device.storageMode'),

  /// The one profile this device opens, when restricted (UC-19).
  deviceProfileId('cerberus.device.profileId'),

  /// Light, dark or system (UC-10).
  themeMode('cerberus.preference.themeMode'),

  /// The auto-lock timeout, in seconds, or `never` (UC-10).
  autoLockTimeout('cerberus.preference.autoLockTimeout'),

  /// The clipboard clearing interval, in seconds, or `never` (UC-10).
  clipboardClearInterval('cerberus.preference.clipboardClearInterval');

  const PreferenceKey(this.storageKey);

  /// The name the platform store files the value under.
  final String storageKey;
}

/// Reads and writes non-sensitive settings.
abstract interface class PreferencesStore {
  /// The stored value, or `null` when none is stored.
  Future<String?> read(PreferenceKey key);

  /// Stores [value] under [key], replacing any previous one.
  Future<void> write(PreferenceKey key, String value);

  /// Removes [key]. Removing an absent key is not an error.
  Future<void> remove(PreferenceKey key);
}

/// Holds preferences in memory for the life of the process.
///
/// The web's implementation (`FR-PS-04`, `FR-OF-16`): a setting chosen in the
/// browser lasts for the visit and nothing reaches browser storage.
class MemoryPreferencesStore implements PreferencesStore {
  final Map<PreferenceKey, String> _values = {};

  @override
  Future<String?> read(PreferenceKey key) async => _values[key];

  @override
  Future<void> write(PreferenceKey key, String value) async =>
      _values[key] = value;

  @override
  Future<void> remove(PreferenceKey key) async => _values.remove(key);
}

/// The preferences store for this target: the platform's on Windows, Linux and
/// Android, memory on the web. Overridden in tests.
final preferencesStoreProvider = Provider<PreferencesStore>(
  (ref) => createPreferencesStore(),
);
