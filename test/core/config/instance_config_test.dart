import 'package:cerberus_ui/core/config/app_config.dart';
import 'package:cerberus_ui/core/config/instance_config.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/recording_stores.dart';

ProviderContainer _container({
  required String buildAddress,
  RecordingPreferencesStore? preferences,
}) {
  final container = ProviderContainer(
    overrides: [
      appConfigProvider.overrideWithValue(
        AppConfig(apiBaseUrl: buildAddress, allowPlainHttp: false),
      ),
      preferencesStoreProvider.overrideWithValue(
        preferences ?? RecordingPreferencesStore(),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('InstanceConfigController', () {
    test('Given no build-time address and none stored '
        'When the configuration is restored '
        'Then no instance is configured', () async {
      final container = _container(buildAddress: '');

      await container.read(instanceConfigProvider.notifier).restore();

      expect(container.read(instanceConfigProvider), isNull);
    });

    test('Given a build-time address '
        'When the configuration is read '
        'Then it is the instance', () {
      final container = _container(buildAddress: 'https://default.example');

      expect(
        container.read(instanceConfigProvider).toString(),
        'https://default.example',
      );
    });

    test('Given an address the user adopted on an earlier run '
        'When the configuration is restored '
        'Then it wins over the build default', () async {
      final preferences = RecordingPreferencesStore()
        ..values[PreferenceKey.instanceAddress] = 'https://chosen.example';
      final container = _container(
        buildAddress: 'https://default.example',
        preferences: preferences,
      );

      await container.read(instanceConfigProvider.notifier).restore();

      expect(
        container.read(instanceConfigProvider).toString(),
        'https://chosen.example',
      );
    });

    test('Given a stored address that no longer parses '
        'When the configuration is restored '
        'Then it is ignored rather than trusted', () async {
      final preferences = RecordingPreferencesStore()
        ..values[PreferenceKey.instanceAddress] = 'http://plain.example';
      final container = _container(
        buildAddress: 'https://default.example',
        preferences: preferences,
      );

      await container.read(instanceConfigProvider.notifier).restore();

      expect(
        container.read(instanceConfigProvider).toString(),
        'https://default.example',
      );
    });

    test('Given a malformed build-time address '
        'When the configuration is read '
        'Then no instance is configured', () {
      final container = _container(buildAddress: 'not a url');

      expect(container.read(instanceConfigProvider), isNull);
    });
  });
}
