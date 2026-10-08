/// Screen-capture protection on Android (IR-17, FR-PV-03).
///
/// The Android runner sets `FLAG_SECURE` when asked through this channel,
/// which excludes every screen from screenshots and the recent-apps preview.
/// The channel is the application's own — no package stands between it and
/// the window. Other targets have no equivalent, and are not asked.
library;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// The channel the Android runner's `MainActivity` answers on.
const screenSecurityChannel = MethodChannel(
  'com.arturrios.cerberus_ui/screen_security',
);

/// Asks the Android runner to protect the window. Does nothing elsewhere.
Future<void> enableScreenSecurity({
  TargetPlatform? platform,
  bool? isWeb,
}) async {
  if (isWeb ?? kIsWeb) return;
  if ((platform ?? defaultTargetPlatform) != TargetPlatform.android) return;

  await screenSecurityChannel.invokeMethod<void>('enable');
}
