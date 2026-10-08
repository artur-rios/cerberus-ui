/// The route table and what each route requires (System Requirements §5).
///
/// Routes are constants rather than literals scattered through the
/// application, and every one is classified here — which is what the single
/// guard in `route_guard.dart` reads. A screen is added to the router by the
/// use case that implements it; its route is already classified, so it is
/// guarded from the moment it exists (IR-03, FR-DA-09).
library;

/// The least a route requires.
enum RouteAccess {
  /// Reachable without a session: setup, registration, sign-in.
  anonymous,

  /// Reachable only while a second-factor challenge is outstanding.
  challenge,

  /// Reachable with a session, vault locked or not.
  signedIn,

  /// Reachable only with the vault unlocked.
  unlocked,
}

/// Why the guard refused a route, shown by the not-available screen.
enum UnavailableReason {
  /// The protocol gate is closed (FR-CR-02, UC-07 AF-06).
  protocol('protocol'),

  /// The route needs the default storage mode (FR-OF-15).
  storageMode('storage-mode'),

  /// The content is outside the device profile (FR-PF-06, UC-07 AF-03).
  deviceProfile('device-profile');

  const UnavailableReason(this.parameter);

  /// The value carried in the query string.
  final String parameter;

  /// The reason named by [parameter], defaulting to [protocol].
  static UnavailableReason fromParameter(String? parameter) =>
      values.firstWhere(
        (reason) => reason.parameter == parameter,
        orElse: () => protocol,
      );
}

abstract final class Routes {
  // §5.1 — configuration, identity and unlock.
  static const setup = '/setup';

  /// The neutral screen shown while a stored session is verified (UC-05).
  static const starting = '/starting';

  /// The query parameter carrying the route the user asked for while the
  /// guard sends them somewhere first — the start (UC-05 step 6), sign-in,
  /// the challenge, protection setup or unlock (UC-07 steps 5 and 7).
  static const continueParameter = 'continue';
  static const register = '/register';
  static const signIn = '/sign-in';
  static const challenge = '/sign-in/challenge';
  static const closureCancel = '/closure/cancel';
  static const vaultSetup = '/vault/setup';
  static const unlock = '/unlock';
  static const recover = '/recover';

  // §5.2 — the vault.
  static const home = '/';
  static const records = '/records';
  static const folders = '/folders';
  static const collections = '/collections';
  static const shared = '/shared';
  static const profiles = '/profiles';
  static const softwareAccess = '/software-access';
  static const trash = '/trash';
  static const sync = '/sync';

  // §5.3 — settings.
  static const settings = '/settings';
  static const deviceSettings = '/settings/device';
  static const accountSettings = '/settings/account';
  static const securitySettings = '/settings/security';
  static const offlineSettings = '/settings/offline';
  static const privacySettings = '/settings/privacy';

  /// Where the guard sends a refused route, with an [UnavailableReason].
  static const unavailable = '/unavailable';

  /// The query parameter carrying the [UnavailableReason].
  static const reasonParameter = 'reason';

  /// The starting location, remembering [destination] unless it is home.
  static String startingFor(Uri destination) {
    final target = destination.toString();
    return target.isEmpty || target == home
        ? starting
        : Uri(
            path: starting,
            queryParameters: {continueParameter: target},
          ).toString();
  }

  /// Where the starting screen at [location] should release the user to: the
  /// destination it remembered, if that is a location within this
  /// application, and home otherwise.
  static String destinationAfterStart(Uri location) =>
      rememberedIn(location) ?? home;

  /// The routes the guard sends a user to so that a requirement can be met.
  /// Each carries the route that was asked for, and none is ever remembered
  /// itself — so a remembered route cannot lead back to one (UC-07 step 7).
  static const Set<String> interstitial = {
    starting,
    signIn,
    challenge,
    vaultSetup,
    unlock,
    recover,
  };

  /// The route [location] carries in its [continueParameter], if it names a
  /// location within this application that is worth returning to; `null`
  /// otherwise. The parameter arrives in an address anyone can type, so a
  /// scheme, an authority, a protocol-relative path or a route that only
  /// sends the user elsewhere is never followed.
  static String? rememberedIn(Uri location) {
    final target = location.queryParameters[continueParameter];
    if (target == null || !target.startsWith('/') || target.startsWith('//')) {
      return null;
    }
    final parsed = Uri.tryParse(target);
    if (parsed == null ||
        parsed.hasScheme ||
        parsed.hasAuthority ||
        !_worthRemembering(parsed.path)) {
      return null;
    }
    return target;
  }

  /// What a redirect away from [location] should remember: the route the
  /// [location] itself carries when it is a step on the way somewhere, the
  /// [location] when it is a destination, and nothing for home or a place the
  /// guard only lands people on (UC-07 step 5).
  static String? rememberFrom(Uri location) {
    final path = location.path.isEmpty ? home : location.path;
    if (interstitial.contains(path)) return rememberedIn(location);
    return _worthRemembering(path) ? location.toString() : null;
  }

  /// [path], remembering [target] when there is one.
  static String carrying(String path, String? target) => target == null
      ? path
      : Uri(
          path: path,
          queryParameters: {continueParameter: target},
        ).toString();

  static bool _worthRemembering(String path) =>
      path != home &&
      path != unavailable &&
      !interstitial.contains(path) &&
      !anonymous.contains(path);

  /// The not-available location for [reason].
  static String unavailableFor(UnavailableReason reason) => Uri(
    path: unavailable,
    queryParameters: {reasonParameter: reason.parameter},
  ).toString();

  /// The only routes reachable without a session. Membership of this set is
  /// the only thing that makes a route anonymous, so a new screen cannot
  /// become reachable by having been forgotten.
  static const Set<String> anonymous = {setup, register, signIn};

  /// Routes needing a session but not an unlocked vault.
  static const Set<String> signedInOnly = {
    closureCancel,
    vaultSetup,
    unlock,
    recover,
    settings,
    deviceSettings,
    accountSettings,
    unavailable,
  };

  /// The routes that unlock or initialize the vault — protocol-dependent,
  /// although they need no unlocked vault (FR-CR-02).
  static const Set<String> vaultEntry = {vaultSetup, unlock, recover};

  /// What [path] requires. A path not named above is treated as needing a
  /// session, so an unknown address reveals nothing to a signed-out visitor.
  static RouteAccess accessFor(String path) {
    if (anonymous.contains(path)) return RouteAccess.anonymous;
    if (path == challenge) return RouteAccess.challenge;
    if (signedInOnly.contains(path)) return RouteAccess.signedIn;
    if (path == home || _unlockedPrefixes.any((p) => isWithin(path, p))) {
      return RouteAccess.unlocked;
    }
    return RouteAccess.signedIn;
  }

  /// Whether [path] depends on the Cerberus protocol: everything that needs
  /// an unlocked vault, and the routes that unlock or initialize it.
  static bool requiresProtocol(String path) =>
      vaultEntry.contains(path) || accessFor(path) == RouteAccess.unlocked;

  /// Whether [path] is [prefix] or lies beneath it.
  static bool isWithin(String path, String prefix) =>
      path == prefix || path.startsWith('$prefix/');

  static const _unlockedPrefixes = [
    records,
    folders,
    collections,
    shared,
    profiles,
    softwareAccess,
    trash,
    sync,
    securitySettings,
    offlineSettings,
    privacySettings,
  ];
}
