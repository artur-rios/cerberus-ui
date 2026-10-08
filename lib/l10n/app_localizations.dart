import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The application's name, in the window title and task switcher.
  ///
  /// In en, this message translates to:
  /// **'Cerberus'**
  String get appTitle;

  /// Title of the screen shown when the route guard refuses a route.
  ///
  /// In en, this message translates to:
  /// **'Not available'**
  String get notAvailableTitle;

  /// Why a protocol-dependent route is refused while the protocol gate is closed (UC-07 AF-06).
  ///
  /// In en, this message translates to:
  /// **'This part of the vault waits for the Cerberus protocol to pass its security review. Nothing that encrypts, decrypts or unlocks is offered until then.'**
  String get notAvailableProtocol;

  /// Why a default-mode-only route is refused on an online-only device.
  ///
  /// In en, this message translates to:
  /// **'This is only available when the device keeps an encrypted copy of the vault. This device runs online only.'**
  String get notAvailableStorageMode;

  /// Why content outside the device profile is refused (UC-07 AF-03).
  ///
  /// In en, this message translates to:
  /// **'This device is restricted to one profile, and this content is outside it.'**
  String get notAvailableDeviceProfile;

  /// Title of the screen shown for a route that does not exist (UC-07 AF-05).
  ///
  /// In en, this message translates to:
  /// **'Page not found'**
  String get notFoundTitle;

  /// Body of the not-found screen.
  ///
  /// In en, this message translates to:
  /// **'There is nothing at this address.'**
  String get notFoundBody;

  /// Shown on a route the application reserves but does not implement yet.
  ///
  /// In en, this message translates to:
  /// **'This screen is not available in this version yet.'**
  String get pendingFeatureBody;

  /// Title of the sign-in screen (UC-03).
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInTitle;

  /// Label of the sign-in email field.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signInEmailLabel;

  /// Label of the sign-in password field.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get signInPasswordLabel;

  /// The button that submits the sign-in.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInSubmit;

  /// States under the sign-in form that a session opens nothing (UC-03: signing in never unlocks the vault).
  ///
  /// In en, this message translates to:
  /// **'Signing in does not unlock your vault.'**
  String get signInVaultStaysLocked;

  /// Heading of the sign-in failure shown when the instance cannot be reached (UC-03 AF-03).
  ///
  /// In en, this message translates to:
  /// **'Connection lost'**
  String get signInConnectionLostTitle;

  /// The button that retries a sign-in the instance did not answer (UC-03 AF-03).
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get signInRetry;

  /// Heading shown when secure storage is unavailable after a completed sign-in (UC-03 AF-05).
  ///
  /// In en, this message translates to:
  /// **'This session can\'t be kept'**
  String get signInSessionNotKeptTitle;

  /// Explains that the session cannot be kept and what continuing means (UC-03 AF-05).
  ///
  /// In en, this message translates to:
  /// **'This device\'s secure storage is unavailable, so Cerberus can\'t keep your session. Nothing will be saved to a file or to preferences instead. You can continue until you close Cerberus, and you\'ll need to sign in again next time.'**
  String get signInSessionNotKeptBody;

  /// Continues with the session held in memory until the application closes (UC-03 AF-05).
  ///
  /// In en, this message translates to:
  /// **'Continue for now'**
  String get signInContinueForThisRun;

  /// Declines to continue with a session that cannot be kept (UC-03 AF-05).
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get signInDiscardSession;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
