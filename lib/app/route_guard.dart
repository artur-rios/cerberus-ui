/// The single route guard, as a pure function (IR-03, FR-DA-09, NFR-05).
///
/// Every route passes it, however it was reached — navigation, a typed web
/// URL, a deep link or a restored session. It decides by four things: the
/// session, the vault lock state, the device profile and the storage mode —
/// and by the protocol gate, which keeps every protocol-dependent route
/// refusing while it is closed (FR-CR-02).
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
  });

  /// Whether an instance address has been adopted (UC-01).
  final bool instanceConfigured;

  final SessionState session;
  final VaultState vault;
  final bool protocolGateOpen;
  final DeviceSettings device;
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

  final access = Routes.accessFor(path);

  switch (state.session) {
    case SignedOut():
      return access == RouteAccess.anonymous ? null : Routes.signIn;

    // A pending challenge grants nothing: every route but the challenge
    // behaves as signed out (FR-SE-04).
    case ChallengePending():
      return switch (access) {
        RouteAccess.anonymous || RouteAccess.challenge => null,
        _ => Routes.signIn,
      };

    case SignedIn():
      return _signedIn(state, path, access);
  }
}

String? _signedIn(GuardState state, String path, RouteAccess access) {
  // A session has no business on sign-in or the challenge. Home is resolved
  // here rather than left to a second pass, so the answer is final: with the
  // gate closed or the vault locked, home itself redirects.
  if (access == RouteAccess.anonymous || access == RouteAccess.challenge) {
    return _signedIn(state, Routes.home, RouteAccess.unlocked) ?? Routes.home;
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
    return vault is VaultProtectionUninitialized ? null : Routes.home;
  }

  if (path == Routes.unlock || path == Routes.recover) {
    return switch (vault) {
      VaultLocked() => null,
      VaultProtectionUninitialized() => Routes.vaultSetup,
      VaultUnlocked() => Routes.home,
    };
  }

  if (access == RouteAccess.unlocked) {
    return switch (vault) {
      VaultUnlocked() => null,
      VaultLocked() => Routes.unlock,
      VaultProtectionUninitialized() => Routes.vaultSetup,
    };
  }

  return null;
}

/// The profile identifier in `/profiles/<id>[/...]`, or `null`.
String? _profileIdIn(String path) {
  if (!path.startsWith('${Routes.profiles}/')) return null;
  final segments = Uri(path: path).pathSegments;
  return segments.length >= 2 && segments[1].isNotEmpty ? segments[1] : null;
}
