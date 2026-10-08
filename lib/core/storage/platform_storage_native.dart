/// Windows, Linux and Android storage: the platform's own (IR-07, §2.6).
///
/// Secure storage is the Android Keystore, Windows DPAPI or the Linux secret
/// service; preferences are the platform's preference store. Neither is used
/// on the web, which compiles `platform_storage_web.dart` instead.
library;

import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'preferences_store.dart';
import 'secure_store.dart';

/// This target's secure store: the platform's.
SecureStore createSecureStore() => PlatformSecureStore();

/// This target's preferences store: the platform's.
PreferencesStore createPreferencesStore() => PlatformPreferencesStore();

/// The platform-backed [SecureStore].
class PlatformSecureStore implements SecureStore {
  PlatformSecureStore([FlutterSecureStorage? storage])
    : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  @override
  Future<String?> read(SecureKey key) =>
      _guard(() => _storage.read(key: key.storageKey));

  @override
  Future<void> write(SecureKey key, String value) =>
      _guard(() => _storage.write(key: key.storageKey, value: value));

  @override
  Future<void> delete(SecureKey key) =>
      _guard(() => _storage.delete(key: key.storageKey));

  /// Turns a platform failure into [SecureStoreUnavailableException], carrying
  /// only the platform's error code — never a message that might echo a value.
  Future<T> _guard<T>(Future<T> Function() operation) async {
    try {
      return await operation();
    } on PlatformException catch (error) {
      throw SecureStoreUnavailableException(error.code);
    }
  }
}

/// The platform-backed [PreferencesStore].
class PlatformPreferencesStore implements PreferencesStore {
  PlatformPreferencesStore([SharedPreferencesAsync? preferences])
    : _preferences = preferences ?? SharedPreferencesAsync();

  final SharedPreferencesAsync _preferences;

  @override
  Future<String?> read(PreferenceKey key) =>
      _preferences.getString(key.storageKey);

  @override
  Future<void> write(PreferenceKey key, String value) =>
      _preferences.setString(key.storageKey, value);

  @override
  Future<void> remove(PreferenceKey key) => _preferences.remove(key.storageKey);
}
