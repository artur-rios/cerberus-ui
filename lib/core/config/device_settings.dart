/// Per-device settings: storage mode and device profile (FR-CF-04 … FR-CF-09).
///
/// Kept in preferences on desktop and Android and in memory on the web. Choosing
/// a mode is UC-37's and restricting the device is UC-19's; this is the state
/// they change and the route guard reads (IR-03).
library;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../storage/preferences_store.dart';

/// Where vault data may live on this device (§2.6, Technology Stack §4).
enum StorageMode {
  /// Offline-capable: a ciphertext local store on Windows, Linux and Android.
  defaultMode('default'),

  /// Nothing persisted; vault data lives in memory while displayed. Always the
  /// mode on the web (`FR-CF-05`).
  onlineOnly('online-only');

  const StorageMode(this.storedValue);

  /// The value written to preferences.
  final String storedValue;

  /// The mode stored as [value], or `null` when it names none.
  static StorageMode? fromStoredValue(String? value) {
    for (final mode in values) {
      if (mode.storedValue == value) return mode;
    }
    return null;
  }
}

/// The device's settings.
@immutable
class DeviceSettings {
  const DeviceSettings({required this.storageMode, this.deviceProfileId});

  /// The settings a device starts with: the default mode where it exists,
  /// online only on the web (`FR-CF-04`, `FR-CF-05`), and no restriction.
  factory DeviceSettings.initial({required bool isWeb}) => DeviceSettings(
    storageMode: isWeb ? StorageMode.onlineOnly : StorageMode.defaultMode,
  );

  final StorageMode storageMode;

  /// The one profile this device opens, or `null` when unrestricted (UC-19).
  /// The API's public identifier, carried opaquely.
  final String? deviceProfileId;

  /// Whether the device is restricted to one profile.
  bool get isRestricted => deviceProfileId != null;

  @override
  bool operator ==(Object other) =>
      other is DeviceSettings &&
      other.storageMode == storageMode &&
      other.deviceProfileId == deviceProfileId;

  @override
  int get hashCode => Object.hash(storageMode, deviceProfileId);
}

/// Whether this build runs on the web. A provider so tests can say either.
final isWebProvider = Provider<bool>((ref) => kIsWeb);

/// Holds the device settings.
class DeviceSettingsController extends Notifier<DeviceSettings> {
  @override
  DeviceSettings build() =>
      DeviceSettings.initial(isWeb: ref.read(isWebProvider));

  /// Restores the settings chosen on an earlier run. The web has nothing to
  /// restore, and never leaves online-only mode whatever a store says.
  Future<void> restore() async {
    if (ref.read(isWebProvider)) return;

    final preferences = ref.read(preferencesStoreProvider);
    final mode = StorageMode.fromStoredValue(
      await preferences.read(PreferenceKey.storageMode),
    );
    final profileId = await preferences.read(PreferenceKey.deviceProfileId);

    state = DeviceSettings(
      storageMode: mode ?? state.storageMode,
      deviceProfileId: profileId,
    );
  }
}

/// The device's settings.
final deviceSettingsProvider =
    NotifierProvider<DeviceSettingsController, DeviceSettings>(
      DeviceSettingsController.new,
    );
