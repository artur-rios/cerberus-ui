/// Pumps the whole application with its stores replaced by recording fakes.
library;

import 'package:cerberus_ui/app/cerberus_app.dart';
import 'package:cerberus_ui/core/config/app_config.dart';
import 'package:cerberus_ui/core/config/device_settings.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'recording_stores.dart';

/// Pumps [CerberusApp] and returns its container.
Future<ProviderContainer> pumpCerberusApp(
  WidgetTester tester, {
  String instance = 'https://vault.example',
  List<Override> overrides = const [],
}) async {
  final container = ProviderContainer(
    overrides: [
      appConfigProvider.overrideWithValue(
        AppConfig(apiBaseUrl: instance, allowPlainHttp: false),
      ),
      isWebProvider.overrideWithValue(false),
      secureStoreProvider.overrideWithValue(RecordingSecureStore()),
      preferencesStoreProvider.overrideWithValue(RecordingPreferencesStore()),
      ...overrides,
    ],
  );
  addTearDown(container.dispose);

  await tester.pumpWidget(
    UncontrolledProviderScope(container: container, child: const CerberusApp()),
  );
  await tester.pumpAndSettle();

  return container;
}
