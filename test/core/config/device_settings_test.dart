import 'package:cerberus_ui/core/config/device_settings.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/recording_stores.dart';

ProviderContainer _container({
  required bool isWeb,
  RecordingPreferencesStore? preferences,
}) {
  final container = ProviderContainer(
    overrides: [
      isWebProvider.overrideWithValue(isWeb),
      preferencesStoreProvider.overrideWithValue(
        preferences ?? RecordingPreferencesStore(),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('DeviceSettingsController', () {
    test('Given a desktop or Android device with nothing stored '
        'When the settings are read '
        'Then it runs in the default mode, unrestricted (FR-CF-04)', () async {
      final container = _container(isWeb: false);

      await container.read(deviceSettingsProvider.notifier).restore();

      expect(
        container.read(deviceSettingsProvider),
        const DeviceSettings(storageMode: StorageMode.defaultMode),
      );
      expect(container.read(deviceSettingsProvider).isRestricted, isFalse);
    });

    test('Given the web '
        'When the settings are read '
        'Then it is online only (FR-CF-05)', () {
      final container = _container(isWeb: true);

      expect(
        container.read(deviceSettingsProvider).storageMode,
        StorageMode.onlineOnly,
      );
    });

    test('Given the web and a store claiming the default mode '
        'When the settings are restored '
        'Then the web stays online only and reads nothing', () async {
      final preferences = RecordingPreferencesStore()
        ..values[PreferenceKey.storageMode] =
            StorageMode.defaultMode.storedValue;
      final container = _container(isWeb: true, preferences: preferences);

      await container.read(deviceSettingsProvider.notifier).restore();

      expect(
        container.read(deviceSettingsProvider).storageMode,
        StorageMode.onlineOnly,
      );
    });

    test('Given stored settings on a desktop device '
        'When they are restored '
        'Then the mode and the device profile are applied', () async {
      final preferences = RecordingPreferencesStore()
        ..values[PreferenceKey.storageMode] = StorageMode.onlineOnly.storedValue
        ..values[PreferenceKey.deviceProfileId] = 'profile-1';
      final container = _container(isWeb: false, preferences: preferences);

      await container.read(deviceSettingsProvider.notifier).restore();

      expect(
        container.read(deviceSettingsProvider),
        const DeviceSettings(
          storageMode: StorageMode.onlineOnly,
          deviceProfileId: 'profile-1',
        ),
      );
      expect(container.read(deviceSettingsProvider).isRestricted, isTrue);
    });

    test('Given an unknown stored mode '
        'When the settings are restored '
        'Then the default mode is kept', () async {
      final preferences = RecordingPreferencesStore()
        ..values[PreferenceKey.storageMode] = 'something-else';
      final container = _container(isWeb: false, preferences: preferences);

      await container.read(deviceSettingsProvider.notifier).restore();

      expect(
        container.read(deviceSettingsProvider).storageMode,
        StorageMode.defaultMode,
      );
    });
  });

  group('DeviceSettings', () {
    test('Given two settings with the same mode and restriction '
        'When they are compared '
        'Then they are equal, hash codes included', () {
      const a = DeviceSettings(
        storageMode: StorageMode.defaultMode,
        deviceProfileId: 'profile-1',
      );
      const b = DeviceSettings(
        storageMode: StorageMode.defaultMode,
        deviceProfileId: 'profile-1',
      );

      expect(a, b);
      expect(a.hashCode, b.hashCode);
    });

    test('Given two settings differing only in mode or only in restriction '
        'When they are compared '
        'Then they differ', () {
      const base = DeviceSettings(storageMode: StorageMode.defaultMode);

      expect(
        base,
        isNot(const DeviceSettings(storageMode: StorageMode.onlineOnly)),
      );
      expect(
        base,
        isNot(
          const DeviceSettings(
            storageMode: StorageMode.defaultMode,
            deviceProfileId: 'profile-1',
          ),
        ),
      );
    });
  });
}
