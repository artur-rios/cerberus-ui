/// Presentation and safety preferences: the theme, the auto-lock timeout and
/// the clipboard clearing interval (FR-PS-01 … FR-PS-04, BR-13, BR-14).
///
/// Kept in preferences on desktop and Android and in memory on the web.
/// Choosing them is UC-10's; this is the state the shell renders by and that
/// locking (UC-14) and copying (UC-23) read. Here, rather than in a feature,
/// because `core/session` owns auto-lock and a core module does not depend on
/// a feature.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../result/result.dart';
import '../storage/preferences_store.dart';
import 'device_settings.dart';

/// A positive interval, or never (Business Rules §5).
@immutable
class PreferenceInterval {
  /// An interval of [duration], which must be positive.
  const PreferenceInterval(Duration this.duration);

  /// Never: the timer this interval drives does not run.
  const PreferenceInterval.never() : duration = null;

  /// The interval, or `null` for never.
  final Duration? duration;

  /// Whether this is never.
  bool get isNever => duration == null;

  /// The value written to preferences: whole seconds, or `never`.
  String get storedValue => duration?.inSeconds.toString() ?? _never;

  /// The interval stored as [value], or `null` when it names none — which
  /// includes a zero or negative interval, since only a positive one exists.
  static PreferenceInterval? fromStoredValue(String? value) {
    if (value == _never) return const PreferenceInterval.never();
    final seconds = int.tryParse(value ?? '');
    if (seconds == null || seconds <= 0) return null;
    return PreferenceInterval(Duration(seconds: seconds));
  }

  static const _never = 'never';

  @override
  bool operator ==(Object other) =>
      other is PreferenceInterval && other.duration == duration;

  @override
  int get hashCode => duration.hashCode;

  @override
  String toString() => 'PreferenceInterval($storedValue)';
}

/// The preferences.
@immutable
class Preferences {
  const Preferences({
    required this.themeMode,
    required this.autoLockTimeout,
    required this.clipboardClearInterval,
  });

  /// What every device starts from, and every web visit (System Requirements
  /// §4, Preferences): the system theme, five minutes, thirty seconds.
  static const defaults = Preferences(
    themeMode: ThemeMode.system,
    autoLockTimeout: PreferenceInterval(Duration(minutes: 5)),
    clipboardClearInterval: PreferenceInterval(Duration(seconds: 30)),
  );

  /// Light, dark or system (FR-PS-01).
  final ThemeMode themeMode;

  /// How long the vault stays unlocked without interaction (FR-PS-02).
  final PreferenceInterval autoLockTimeout;

  /// How long a copied value stays on the clipboard (FR-PS-03).
  final PreferenceInterval clipboardClearInterval;

  Preferences copyWith({
    ThemeMode? themeMode,
    PreferenceInterval? autoLockTimeout,
    PreferenceInterval? clipboardClearInterval,
  }) => Preferences(
    themeMode: themeMode ?? this.themeMode,
    autoLockTimeout: autoLockTimeout ?? this.autoLockTimeout,
    clipboardClearInterval:
        clipboardClearInterval ?? this.clipboardClearInterval,
  );

  @override
  bool operator ==(Object other) =>
      other is Preferences &&
      other.themeMode == themeMode &&
      other.autoLockTimeout == autoLockTimeout &&
      other.clipboardClearInterval == clipboardClearInterval;

  @override
  int get hashCode =>
      Object.hash(themeMode, autoLockTimeout, clipboardClearInterval);
}

/// The theme mode stored as [value], or `null` when it names none.
ThemeMode? themeModeFromStoredValue(String? value) {
  for (final mode in ThemeMode.values) {
    if (mode.name == value) return mode;
  }
  return null;
}

/// Holds the preferences.
///
/// A choice applies the moment it is made — the state changes first — and is
/// then kept (UC-10 step 6). When it cannot be kept, it still applies for this
/// run and the caller is told (AF-04).
class PreferencesController extends Notifier<Preferences> {
  @override
  Preferences build() => Preferences.defaults;

  /// Restores the preferences chosen on an earlier run. The web has nothing to
  /// restore: each visit starts from the defaults (AF-03). A stored value that
  /// names nothing valid leaves its default in place.
  Future<void> restore() async {
    if (ref.read(isWebProvider)) return;

    final preferences = ref.read(preferencesStoreProvider);
    final theme = themeModeFromStoredValue(
      await preferences.read(PreferenceKey.themeMode),
    );
    final autoLock = PreferenceInterval.fromStoredValue(
      await preferences.read(PreferenceKey.autoLockTimeout),
    );
    final clipboard = PreferenceInterval.fromStoredValue(
      await preferences.read(PreferenceKey.clipboardClearInterval),
    );

    state = state.copyWith(
      themeMode: theme,
      autoLockTimeout: autoLock,
      clipboardClearInterval: clipboard,
    );
  }

  /// Chooses the theme (step 3).
  Future<Result<void>> setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    return _keep(PreferenceKey.themeMode, mode.name);
  }

  /// Chooses the auto-lock timeout (step 4). Never is the caller's to confirm
  /// first (AF-01).
  Future<Result<void>> setAutoLockTimeout(PreferenceInterval interval) {
    state = state.copyWith(autoLockTimeout: interval);
    return _keep(PreferenceKey.autoLockTimeout, interval.storedValue);
  }

  /// Chooses the clipboard clearing interval (step 5). Never is the caller's
  /// to confirm first (AF-02).
  Future<Result<void>> setClipboardClearInterval(PreferenceInterval interval) {
    state = state.copyWith(clipboardClearInterval: interval);
    return _keep(PreferenceKey.clipboardClearInterval, interval.storedValue);
  }

  /// Writes [value] under [key]: to the platform's preferences on desktop and
  /// Android, to memory on the web (step 6). A failure carries nothing from
  /// the platform's message.
  Future<Result<void>> _keep(PreferenceKey key, String value) async {
    try {
      await ref.read(preferencesStoreProvider).write(key, value);
      return const Success(null);
    } on Exception {
      return const Failure(
        message: 'preferences_not_kept',
        kind: FailureKind.deviceStorage,
      );
    }
  }
}

/// The preferences.
final preferencesProvider =
    NotifierProvider<PreferencesController, Preferences>(
      PreferencesController.new,
    );
