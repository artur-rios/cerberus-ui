// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Cerberus';

  @override
  String get notAvailableTitle => 'Not available';

  @override
  String get notAvailableProtocol =>
      'This part of the vault waits for the Cerberus protocol to pass its security review. Nothing that encrypts, decrypts or unlocks is offered until then.';

  @override
  String get notAvailableStorageMode =>
      'This is only available when the device keeps an encrypted copy of the vault. This device runs online only.';

  @override
  String get notAvailableDeviceProfile =>
      'This device is restricted to one profile, and this content is outside it.';

  @override
  String get notFoundTitle => 'Page not found';

  @override
  String get notFoundBody => 'There is nothing at this address.';

  @override
  String get pendingFeatureBody =>
      'This screen is not available in this version yet.';
}
