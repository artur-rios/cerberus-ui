/// Application entry point.
///
/// Start-up order is deliberate: the window is protected first, then the
/// instance, device settings and preferences are restored, and a stored
/// session's verification begins, and only then is anything shown — behind the
/// router's guard, which sends a visitor with no instance to setup, holds the
/// start while a stored session is verified, and sends one with no session to
/// sign-in before any screen that depends on them.
library;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/cerberus_app.dart';
import 'app/screen_security.dart';
import 'core/config/device_settings.dart';
import 'core/config/instance_config.dart';
import 'core/config/preferences.dart';
import 'features/session/state/session_restore_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await enableScreenSecurity();

  final container = ProviderContainer();
  await container.read(instanceConfigProvider.notifier).restore();
  await container.read(deviceSettingsProvider.notifier).restore();
  await container.read(preferencesProvider.notifier).restore();
  // Started before the first frame, so the guard holds the start while a
  // stored session is verified (UC-05). Not awaited: the starting screen is
  // what the user sees meanwhile.
  unawaited(container.read(sessionRestoreProvider.notifier).restore());

  runApp(
    UncontrolledProviderScope(container: container, child: const CerberusApp()),
  );
}
