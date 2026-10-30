import 'package:cerberus_ui/core/config/device_settings.dart';
import 'package:cerberus_ui/core/config/preferences.dart';
import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/recording_stores.dart';

ProviderContainer _container({
  bool isWeb = false,
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
  group('PreferenceInterval', () {
    test('Given a positive interval '
        'When it is stored and read back '
        'Then it is the same interval, in whole seconds', () {
      const interval = PreferenceInterval(Duration(minutes: 5));

      final restored = PreferenceInterval.fromStoredValue(interval.storedValue);

      expect(interval.storedValue, '300');
      expect(restored, interval);
      expect(restored!.isNever, isFalse);
    });

    test('Given never '
        'When it is stored and read back '
        'Then it is never', () {
      const never = PreferenceInterval.never();

      final restored = PreferenceInterval.fromStoredValue(never.storedValue);

      expect(never.storedValue, 'never');
      expect(restored, never);
      expect(restored!.isNever, isTrue);
    });

    test('Given a stored value naming no positive interval '
        'When it is read '
        'Then it names nothing', () {
      for (final value in [null, '', 'soon', '0', '-30', '1.5']) {
        expect(
          PreferenceInterval.fromStoredValue(value),
          isNull,
          reason: value,
        );
      }
    });
  });

  group('PreferencesController', () {
    test('Given nothing stored '
        'When the preferences are restored '
        'Then they are the defaults: system theme, five minutes, thirty '
        'seconds', () async {
      final container = _container();

      await container.read(preferencesProvider.notifier).restore();

      final preferences = container.read(preferencesProvider);
      expect(preferences, Preferences.defaults);
      expect(preferences.themeMode, ThemeMode.system);
      expect(
        preferences.autoLockTimeout,
        const PreferenceInterval(Duration(minutes: 5)),
      );
      expect(
        preferences.clipboardClearInterval,
        const PreferenceInterval(Duration(seconds: 30)),
      );
    });

    test('Given preferences stored on a desktop device '
        'When they are restored '
        'Then each is applied (FR-PS-04)', () async {
      final store = RecordingPreferencesStore()
        ..values[PreferenceKey.themeMode] = 'dark'
        ..values[PreferenceKey.autoLockTimeout] = 'never'
        ..values[PreferenceKey.clipboardClearInterval] = '120';
      final container = _container(preferences: store);

      await container.read(preferencesProvider.notifier).restore();

      expect(
        container.read(preferencesProvider),
        const Preferences(
          themeMode: ThemeMode.dark,
          autoLockTimeout: PreferenceInterval.never(),
          clipboardClearInterval: PreferenceInterval(Duration(minutes: 2)),
        ),
      );
    });

    test('Given stored values that name nothing valid '
        'When they are restored '
        'Then each keeps its default', () async {
      final store = RecordingPreferencesStore()
        ..values[PreferenceKey.themeMode] = 'sepia'
        ..values[PreferenceKey.autoLockTimeout] = '0'
        ..values[PreferenceKey.clipboardClearInterval] = 'later';
      final container = _container(preferences: store);

      await container.read(preferencesProvider.notifier).restore();

      expect(container.read(preferencesProvider), Preferences.defaults);
    });

    test('Given the web and a store holding preferences '
        'When the preferences are restored '
        'Then nothing is read and the visit starts from the defaults '
        '(AF-03)', () async {
      final store = RecordingPreferencesStore()
        ..values[PreferenceKey.themeMode] = 'dark';
      final container = _container(isWeb: true, preferences: store);

      await container.read(preferencesProvider.notifier).restore();

      expect(container.read(preferencesProvider), Preferences.defaults);
    });

    test('Given the defaults '
        'When the theme, the auto-lock timeout and the clipboard interval are '
        'chosen '
        'Then each applies at once and is kept in preference storage, and '
        'nothing else is written (steps 3–6)', () async {
      final store = RecordingPreferencesStore();
      final container = _container(preferences: store);
      final controller = container.read(preferencesProvider.notifier);

      final results = [
        await controller.setThemeMode(ThemeMode.light),
        await controller.setAutoLockTimeout(
          const PreferenceInterval(Duration(minutes: 15)),
        ),
        await controller.setClipboardClearInterval(
          const PreferenceInterval(Duration(seconds: 10)),
        ),
      ];

      expect(results, everyElement(isA<Success<void>>()));
      expect(
        container.read(preferencesProvider),
        const Preferences(
          themeMode: ThemeMode.light,
          autoLockTimeout: PreferenceInterval(Duration(minutes: 15)),
          clipboardClearInterval: PreferenceInterval(Duration(seconds: 10)),
        ),
      );
      expect(store.writes, [
        'cerberus.preference.themeMode=light',
        'cerberus.preference.autoLockTimeout=900',
        'cerberus.preference.clipboardClearInterval=10',
      ]);
    });

    test('Given an interval of never '
        'When it is chosen '
        'Then never is applied and kept (FR-PS-02, FR-PS-03)', () async {
      final store = RecordingPreferencesStore();
      final container = _container(preferences: store);
      final controller = container.read(preferencesProvider.notifier);

      await controller.setAutoLockTimeout(const PreferenceInterval.never());
      await controller.setClipboardClearInterval(
        const PreferenceInterval.never(),
      );

      expect(
        container.read(preferencesProvider).autoLockTimeout.isNever,
        isTrue,
      );
      expect(
        container.read(preferencesProvider).clipboardClearInterval.isNever,
        isTrue,
      );
      expect(store.values[PreferenceKey.autoLockTimeout], 'never');
      expect(store.values[PreferenceKey.clipboardClearInterval], 'never');
    });

    test('Given preference storage that cannot be written '
        'When a preference is chosen '
        'Then it applies for this run and the failure says it was not kept, '
        'carrying nothing from the platform (AF-04)', () async {
      final store = RecordingPreferencesStore()
        ..writeFailure = Exception('/home/owner/.local/share: disk full');
      final container = _container(preferences: store);

      final result = await container
          .read(preferencesProvider.notifier)
          .setThemeMode(ThemeMode.dark);

      expect(container.read(preferencesProvider).themeMode, ThemeMode.dark);
      expect(
        result,
        const Failure<void>(
          message: 'preferences_not_kept',
          kind: FailureKind.deviceStorage,
        ),
      );
      expect(store.values, isEmpty);
    });

    test('Given the web '
        'When a preference is chosen '
        'Then it is held by the memory store and applies for the visit '
        '(FR-PS-04)', () async {
      final memory = MemoryPreferencesStore();
      final container = ProviderContainer(
        overrides: [
          isWebProvider.overrideWithValue(true),
          preferencesStoreProvider.overrideWithValue(memory),
        ],
      );
      addTearDown(container.dispose);

      final result = await container
          .read(preferencesProvider.notifier)
          .setClipboardClearInterval(
            const PreferenceInterval(Duration(minutes: 1)),
          );

      expect(result, isA<Success<void>>());
      expect(await memory.read(PreferenceKey.clipboardClearInterval), '60');
    });
  });

  group('themeModeFromStoredValue', () {
    test('Given each theme mode '
        'When its stored name is read '
        'Then it is that mode, and an unknown name is none', () {
      for (final mode in ThemeMode.values) {
        expect(themeModeFromStoredValue(mode.name), mode);
      }
      expect(themeModeFromStoredValue('sepia'), isNull);
      expect(themeModeFromStoredValue(null), isNull);
    });
  });
}
