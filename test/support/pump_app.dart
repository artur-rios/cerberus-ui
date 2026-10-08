/// Pumps the whole application with its stores replaced by recording fakes.
library;

import 'dart:async';

import 'package:cerberus_ui/app/cerberus_app.dart';
import 'package:cerberus_ui/core/config/app_config.dart';
import 'package:cerberus_ui/core/config/device_settings.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/state/session_restore_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'recording_stores.dart';

/// Pumps [CerberusApp] and returns its container.
///
/// With [restoreSession], the stored session's verification begins before the
/// first frame, exactly as `main` begins it (UC-05). Without [settle], only one
/// frame is pumped — for a test that holds an answer back, while a progress
/// indicator would keep animating forever.
Future<ProviderContainer> pumpCerberusApp(
  WidgetTester tester, {
  String instance = 'https://vault.example',
  SecureStore? secureStore,
  List<Override> overrides = const [],
  bool restoreSession = false,
  bool settle = true,
}) async {
  final container = ProviderContainer(
    overrides: [
      appConfigProvider.overrideWithValue(
        AppConfig(apiBaseUrl: instance, allowPlainHttp: false),
      ),
      isWebProvider.overrideWithValue(false),
      secureStoreProvider.overrideWithValue(
        secureStore ?? RecordingSecureStore(),
      ),
      preferencesStoreProvider.overrideWithValue(RecordingPreferencesStore()),
      ...overrides,
    ],
  );
  addTearDown(container.dispose);

  if (restoreSession) {
    unawaited(container.read(sessionRestoreProvider.notifier).restore());
  }

  await tester.pumpWidget(
    UncontrolledProviderScope(container: container, child: const CerberusApp()),
  );
  if (settle) {
    await tester.pumpAndSettle();
  } else {
    await tester.pump();
  }

  return container;
}
