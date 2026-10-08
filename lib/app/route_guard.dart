/// The single route guard, as a pure function (IR-03, FR-DA-09, NFR-05).
///
/// Every route passes it, however it was reached — navigation, a typed web
/// URL, a deep link or a restored session. It decides by four things: the
/// session, the vault lock state, the device profile and the storage mode —
/// and by the protocol gate, which keeps every protocol-dependent route
/// refusing while it is closed (FR-CR-02).
///
/// A route it refuses is remembered on the way to sign-in, the challenge,
/// protection setup or unlock, and opened — through this guard again — once
/// that requirement is met (UC-07 steps 5 and 7). Lease validity reaches it as
/// the vault's lock state: an expired lease locks the vault (FR-VA-09,
/// FR-OF-06), and a locked vault is sent to unlock.
///
/// Kept apart from `router.dart` so it can be tested directly on its inputs:
/// this is the rule that decides who reaches what.
library;

import 'package:flutter/foundation.dart';

import '../core/config/device_settings.dart';
import '../core/session/session_state.dart';
import '../core/session/vault_state.dart';
import 'routes.dart';

/// Everything the guard decides by.
@immutable
class GuardState {
  const GuardState({
    required this.instanceConfigured,
    required this.session,
    required this.vault,
    required this.protocolGateOpen,
    required this.device,
    this.startHeld = false,
  });

  /// Whether an instance address has been adopted (UC-01).
  final bool instanceConfigured;

  final SessionState session;
  final VaultState vault;
  final bool protocolGateOpen;
  final DeviceSettings device;

  /// Whether a stored session is being verified at start, or failed to be,
  /// so that no route may be shown yet (UC-05 step 2, AF-04).
  final bool startHeld;
}

/// Where a request for [location] should go: `null` to admit it, or the
/// location to redirect to.
String? resolveRedirect(GuardState state, Uri location) {
  final path = location.path.isEmpty ? Routes.home : location.path;

  // Nothing works without somewhere to send requests, so setup precedes even
  // sign-in.
  if (!state.instanceConfigured) {
    return path == Routes.setup ? null : Routes.setup;
  }

  // A stored session is unverified: nothing that depends on it is shown, and
  // where the user was going is remembered for afterwards (UC-05).
  if (state.startHeld) {
    return path == Routes.starting ? null : Routes.startingFor(location);
  }

  // Verified, or discarded: on to where the user was going. The destination
  // passes the guard here rather than on a second pass, so the answer is
  // final; it is never the starting screen again.
  if (path == Routes.starting) {
    final destination = Routes.destinationAfterStart(location);
    return resolveRedirect(state, Uri.parse(destination)) ?? destination;
  }

  final access = Routes.accessFor(path);
  final remembered = Routes.rememberFrom(location);

  switch (state.session) {
    case SignedOut():
      return access == RouteAccess.anonymous
          ? null
          : Routes.carrying(Routes.signIn, remembered);

    // A pending challenge grants nothing: every route but the challenge
    // behaves as signed out (FR-SE-04).
    case ChallengePending():
      return switch (access) {
        RouteAccess.anonymous || RouteAccess.challenge => null,
        _ => Routes.carrying(Routes.signIn, remembered),
      };

    case SignedIn():
      return _signedIn(state, location, path, access, remembered);
  }
}

/// On from a requirement just met, to the route that was remembered or home.
/// The destination passes the guard here rather than on a second pass, so the
/// answer is final (UC-07 step 7).
String _onwards(GuardState state, String? remembered) {
  final destination = remembered ?? Routes.home;
  return resolveRedirect(state, Uri.parse(destination)) ?? destination;
}

String? _signedIn(
  GuardState state,
  Uri location,
  String path,
  RouteAccess access,
  String? remembered,
) {
  // A session has no business on sign-in or the challenge: it goes on to the
  // route it asked for before signing in, or home.
  if (access == RouteAccess.anonymous || access == RouteAccess.challenge) {
    return _onwards(state, Routes.rememberedIn(location));
  }

  // The protocol gate before anything vault-related: a closed gate means the
  // vault cannot be initialized or unlocked, so sending the user to unlock
  // would only loop them back here.
  if (!state.protocolGateOpen && Routes.requiresProtocol(path)) {
    return Routes.unavailableFor(UnavailableReason.protocol);
  }

  if (Routes.isWithin(path, Routes.sync) &&
      state.device.storageMode != StorageMode.defaultMode) {
    return Routes.unavailableFor(UnavailableReason.storageMode);
  }

  final profileId = _profileIdIn(path);
  final deviceProfileId = state.device.deviceProfileId;
  if (profileId != null &&
      deviceProfileId != null &&
      profileId != deviceProfileId) {
    return Routes.unavailableFor(UnavailableReason.deviceProfile);
  }

  final vault = state.vault;

  if (path == Routes.vaultSetup) {
    return vault is VaultProtectionUninitialized
        ? null
        : _onwards(state, Routes.rememberedIn(location));
  }

  if (path == Routes.unlock || path == Routes.recover) {
    final target = Routes.rememberedIn(location);
    return switch (vault) {
      VaultLocked() => null,
      VaultProtectionUninitialized() => Routes.carrying(
        Routes.vaultSetup,
        target,
      ),
      VaultUnlocked() => _unlockedAtUnlock(state, path, target),
    };
  }

  if (access == RouteAccess.unlocked) {
    return switch (vault) {
      // AF-02: another profile's content is never shown under the open one;
      // that profile is unlocked first.
      VaultUnlocked(profileId: final openProfileId)
          when profileId != null && profileId != openProfileId =>
        Routes.carrying(Routes.unlock, remembered),
      VaultUnlocked() => null,
      VaultLocked() => Routes.carrying(Routes.unlock, remembered),
      VaultProtectionUninitialized() => Routes.carrying(
        Routes.vaultSetup,
        remembered,
      ),
    };
  }

  return null;
}

/// Unlock or recovery requested while a profile is open: admitted only when
/// the remembered route itself is sent to unlock — another profile's content
/// (AF-02). Anything else goes on, so a device restricted to a profile is
/// never offered another one this way (AF-03).
String? _unlockedAtUnlock(GuardState state, String path, String? target) {
  final next = _onwards(state, target);
  return path == Routes.unlock && next == Routes.carrying(Routes.unlock, target)
      ? null
      : next;
}

/// The profile identifier in `/profiles/<id>[/...]`, or `null`.
String? _profileIdIn(String path) {
  if (!path.startsWith('${Routes.profiles}/')) return null;
  final segments = Uri(path: path).pathSegments;
  return segments.length >= 2 && segments[1].isNotEmpty ? segments[1] : null;
}
