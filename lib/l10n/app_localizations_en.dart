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

  @override
  String get signInTitle => 'Sign in';

  @override
  String get signInEmailLabel => 'Email';

  @override
  String get signInPasswordLabel => 'Password';

  @override
  String get signInSubmit => 'Sign in';

  @override
  String get signInVaultStaysLocked => 'Signing in does not unlock your vault.';

  @override
  String get signInConnectionLostTitle => 'Connection lost';

  @override
  String get signInRetry => 'Try again';

  @override
  String get signInSessionNotKeptTitle => 'This session can\'t be kept';

  @override
  String get signInSessionNotKeptBody =>
      'This device\'s secure storage is unavailable, so Cerberus can\'t keep your session. Nothing will be saved to a file or to preferences instead. You can continue until you close Cerberus, and you\'ll need to sign in again next time.';

  @override
  String get signInContinueForThisRun => 'Continue for now';

  @override
  String get signInDiscardSession => 'Cancel';

  @override
  String get challengeTitle => 'Second factor';

  @override
  String get challengeIntro =>
      'Your sign-in needs a second factor. Enter a code from:';

  @override
  String get challengeMethodApp => 'Your authenticator app';

  @override
  String get challengeMethodEmail => 'A code sent to your email';

  @override
  String get challengeCodeLabel => 'Code';

  @override
  String get challengeSubmit => 'Verify';

  @override
  String get challengeRefusedHint =>
      'You can enter another code, or sign in again.';

  @override
  String get challengeRepeatSignIn => 'Sign in again';

  @override
  String get challengeBackToSignIn => 'Back to sign in';
}
