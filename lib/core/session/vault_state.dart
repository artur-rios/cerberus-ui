/// The vault lock lifecycle (System Requirements §4.5, §8).
///
/// Signing in opens nothing. The vault is unlocked into a keyring held in
/// memory only (UC-13), and locks again on request, after inactivity, on lease
/// expiry and on sign-out. While the protocol gate is closed it never unlocks.
library;

import 'package:flutter/foundation.dart';

/// Where the vault stands.
@immutable
sealed class VaultState {
  const VaultState();
}

/// Locked: no key and no plaintext in memory. The default.
final class VaultLocked extends VaultState {
  const VaultLocked();

  @override
  bool operator ==(Object other) => other is VaultLocked;

  @override
  int get hashCode => (VaultLocked).hashCode;
}

/// The account has no vault protection yet, so it has to be initialized
/// before anything can be unlocked (UC-12).
final class VaultProtectionUninitialized extends VaultState {
  const VaultProtectionUninitialized();

  @override
  bool operator ==(Object other) => other is VaultProtectionUninitialized;

  @override
  int get hashCode => (VaultProtectionUninitialized).hashCode;
}

/// Unlocked on one profile. The keys themselves live in the keyring that
/// `core/crypto` holds, never here.
final class VaultUnlocked extends VaultState {
  const VaultUnlocked({required this.profileId});

  /// The open profile's public identifier, carried opaquely.
  final String profileId;

  @override
  bool operator ==(Object other) =>
      other is VaultUnlocked && other.profileId == profileId;

  @override
  int get hashCode => profileId.hashCode;
}
