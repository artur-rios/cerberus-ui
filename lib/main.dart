/// Application entry point.
///
/// Start-up order is deliberate: the window is protected first, then the
/// instance and device settings are restored, and only then is anything shown
/// — behind the router's guard, which sends a visitor with no instance to setup
/// and one with no session to sign-in before any screen that depends on them.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/cerberus_app.dart';
import 'app/screen_security.dart';
import 'core/config/device_settings.dart';
import 'core/config/instance_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await enableScreenSecurity();

  final container = ProviderContainer();
  await container.read(instanceConfigProvider.notifier).restore();
  await container.read(deviceSettingsProvider.notifier).restore();

  runApp(
    UncontrolledProviderScope(container: container, child: const CerberusApp()),
  );
}
