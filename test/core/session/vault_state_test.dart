import 'package:cerberus_ui/core/session/vault_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VaultState', () {
    test('Given two locked vaults '
        'When they are compared '
        'Then they are equal, hash codes included', () {
      expect(const VaultLocked(), const VaultLocked());
      expect(const VaultLocked().hashCode, const VaultLocked().hashCode);
    });

    test('Given two vaults without protection '
        'When they are compared '
        'Then they are equal, hash codes included', () {
      expect(
        const VaultProtectionUninitialized(),
        const VaultProtectionUninitialized(),
      );
      expect(
        const VaultProtectionUninitialized().hashCode,
        const VaultProtectionUninitialized().hashCode,
      );
    });

    test('Given two vaults unlocked on the same profile '
        'When they are compared '
        'Then they are equal, hash codes included', () {
      expect(
        const VaultUnlocked(profileId: 'profile-1'),
        const VaultUnlocked(profileId: 'profile-1'),
      );
      expect(
        const VaultUnlocked(profileId: 'profile-1').hashCode,
        const VaultUnlocked(profileId: 'profile-1').hashCode,
      );
    });

    test('Given two vaults unlocked on different profiles '
        'When they are compared '
        'Then they differ', () {
      expect(
        const VaultUnlocked(profileId: 'profile-1'),
        isNot(const VaultUnlocked(profileId: 'profile-2')),
      );
    });

    test('Given a vault in each state '
        'When each is compared with the others '
        'Then no two states are equal', () {
      const states = <VaultState>[
        VaultLocked(),
        VaultProtectionUninitialized(),
        VaultUnlocked(profileId: 'profile-1'),
      ];

      for (final (i, a) in states.indexed) {
        for (final (j, b) in states.indexed) {
          if (i != j) expect(a, isNot(b), reason: '$a against $b');
        }
      }
    });
  });
}
