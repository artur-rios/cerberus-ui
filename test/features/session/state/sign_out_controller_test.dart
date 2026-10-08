import 'package:cerberus_ui/core/config/device_settings.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_notice.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/session/session_token_store.dart';
import 'package:cerberus_ui/core/session/vault_state.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/data/device_vault_repository.dart';
import 'package:cerberus_ui/features/session/state/sign_out_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/fake_device_vault_repository.dart';
import '../../../support/leak_recorder.dart';

class _OnlineOnlyDevice extends DeviceSettingsController {
  @override
  DeviceSettings build() =>
      const DeviceSettings(storageMode: StorageMode.onlineOnly);
}

class _UnlockedVault extends VaultStateController {
  @override
  VaultState build() => const VaultUnlocked(profileId: 'profile-1');
}

/// A signed-in application with an unlocked vault, its token in [leaks]'
/// secure storage, on a device in [mode] — or on the web.
Future<ProviderContainer> _signedIn(
  LeakRecorder leaks,
  FakeDeviceVaultRepository store, {
  StorageMode mode = StorageMode.defaultMode,
  bool web = false,
}) async {
  final container = ProviderContainer(
    overrides: [
      secureStoreProvider.overrideWithValue(leaks.secureStore),
      preferencesStoreProvider.overrideWithValue(leaks.preferences),
      isWebProvider.overrideWithValue(web),
      deviceVaultRepositoryProvider.overrideWithValue(store),
      vaultStateProvider.overrideWith(_UnlockedVault.new),
      if (mode == StorageMode.onlineOnly)
        deviceSettingsProvider.overrideWith(_OnlineOnlyDevice.new),
    ],
  );
  addTearDown(container.dispose);
  await container
      .read(sessionProvider.notifier)
      .establish(token: 'TOKEN-MARKER', accountId: 'acct-1');
  return container;
}

/// Asserts the session is over in every way UC-06's postconditions name.
Future<void> _expectSignedOut(
  ProviderContainer container,
  LeakRecorder leaks,
) async {
  expect(container.read(sessionProvider), const SignedOut());
  expect(container.read(vaultStateProvider), const VaultLocked());
  expect(await container.read(sessionTokenStoreProvider).read(), isNull);
  expect(container.read(signOutControllerProvider), const SignOutIdle());
  leaks.expectOnlyIn('TOKEN-MARKER', {LeakChannel.secureStorage});
}

void main() {
  group('SignOutController', () {
    test('Given a session in the default mode '
        'When the user chooses to sign out '
        'Then the system asks whether to keep the vault on the device, and '
        'nothing has ended yet (UC-06 step 2)', () async {
      final leaks = LeakRecorder();
      final container = await _signedIn(leaks, FakeDeviceVaultRepository());

      await container.read(signOutControllerProvider.notifier).request();

      expect(
        container.read(signOutControllerProvider),
        const SignOutChoosingStorage(),
      );
      expect(container.read(sessionProvider), isA<SignedIn>());
    });

    test(
      'Given the question about the store '
      'When the user keeps the vault '
      'Then the vault locks, the token is deleted, the state is discarded '
      'and the ciphertext store remains (UC-06 main flow, FR-SE-12)',
      () async {
        final leaks = LeakRecorder();
        final store = FakeDeviceVaultRepository(pendingEdits: 3);
        final container = await _signedIn(leaks, store);
        final signOut = container.read(signOutControllerProvider.notifier);
        await signOut.request();

        await signOut.keepVault();

        await _expectSignedOut(container, leaks);
        expect(store.removals, 0);
        expect(store.exists, isTrue);
        expect(leaks.secureStore.values, isEmpty);
        expect(container.read(sessionNoticeProvider), isEmpty);
      },
    );

    test(
      'Given the question about the store and no pending edits '
      'When the user removes the vault '
      'Then the session ends and the store is deleted (UC-06 step 6)',
      () async {
        final leaks = LeakRecorder();
        final store = FakeDeviceVaultRepository();
        final container = await _signedIn(leaks, store);
        final signOut = container.read(signOutControllerProvider.notifier);
        await signOut.request();

        await signOut.removeVault();

        await _expectSignedOut(container, leaks);
        expect(store.removals, 1);
        expect(container.read(sessionNoticeProvider), isEmpty);
      },
    );

    test('Given two offline edits never uploaded '
        'When the user removes the vault '
        'Then the system states that two edits would be lost and asks again, '
        'and nothing has ended yet (UC-06 AF-01)', () async {
      final leaks = LeakRecorder();
      final store = FakeDeviceVaultRepository(pendingEdits: 2);
      final container = await _signedIn(leaks, store);
      final signOut = container.read(signOutControllerProvider.notifier);
      await signOut.request();

      await signOut.removeVault();

      expect(
        container.read(signOutControllerProvider),
        const SignOutConfirmingLoss(2),
      );
      expect(container.read(sessionProvider), isA<SignedIn>());
      expect(store.removals, 0);
    });

    test(
      'Given the warning that edits would be lost '
      'When the user confirms '
      'Then the session ends and the store is deleted (UC-06 AF-01)',
      () async {
        final leaks = LeakRecorder();
        final store = FakeDeviceVaultRepository(pendingEdits: 2);
        final container = await _signedIn(leaks, store);
        final signOut = container.read(signOutControllerProvider.notifier);
        await signOut.request();
        await signOut.removeVault();

        await signOut.confirmRemoval();

        await _expectSignedOut(container, leaks);
        expect(store.removals, 1);
      },
    );

    test('Given the warning that edits would be lost '
        'When the user declines '
        'Then the store is kept, with its edits, and signing out goes on '
        '(UC-06 AF-01)', () async {
      final leaks = LeakRecorder();
      final store = FakeDeviceVaultRepository(pendingEdits: 2);
      final container = await _signedIn(leaks, store);
      final signOut = container.read(signOutControllerProvider.notifier);
      await signOut.request();
      await signOut.removeVault();

      await signOut.declineRemoval();

      await _expectSignedOut(container, leaks);
      expect(store.removals, 0);
      expect(store.pendingEdits, 2);
    });

    test('Given the question about the store '
        'When the user cancels '
        'Then the session goes on untouched', () async {
      final leaks = LeakRecorder();
      final store = FakeDeviceVaultRepository();
      final container = await _signedIn(leaks, store);
      final signOut = container.read(signOutControllerProvider.notifier);
      await signOut.request();

      signOut.cancel();

      expect(container.read(signOutControllerProvider), const SignOutIdle());
      expect(container.read(sessionProvider), isA<SignedIn>());
      expect(await container.read(sessionTokenStoreProvider).read(), isNotNull);
      expect(store.removals, 0);
    });

    for (final (label, mode, web) in const [
      ('an online-only device', StorageMode.onlineOnly, false),
      ('the web', StorageMode.onlineOnly, true),
    ]) {
      test('Given a session on $label '
          'When the user chooses to sign out '
          'Then nothing is asked, the session ends, and no store is touched '
          '(UC-06 AF-02)', () async {
        final leaks = LeakRecorder();
        final store = FakeDeviceVaultRepository(exists: false);
        final container = await _signedIn(leaks, store, mode: mode, web: web);

        await container.read(signOutControllerProvider.notifier).request();

        await _expectSignedOut(container, leaks);
        expect(store.removals, 0);
      });
    }

    test('Given a token secure storage cannot delete '
        'When the user signs out '
        'Then sign-in reports it, and the vault still locks and the state is '
        'still discarded (UC-06 AF-03)', () async {
      final leaks = LeakRecorder();
      final container = await _signedIn(leaks, FakeDeviceVaultRepository());
      leaks.secureStore.deleteFailure = const SecureStoreUnavailableException(
        'locked',
      );
      final signOut = container.read(signOutControllerProvider.notifier);
      await signOut.request();

      await signOut.keepVault();

      await _expectSignedOut(container, leaks);
      expect(container.read(sessionNoticeProvider), {
        SessionNotice.tokenNotDeleted,
      });
    });

    test('Given a session in the default mode '
        'When the API rejects its token '
        'Then nothing is asked, the store is kept, and sign-in says the '
        'session ended (UC-06 AF-04)', () async {
      final leaks = LeakRecorder();
      final store = FakeDeviceVaultRepository(pendingEdits: 1);
      final container = await _signedIn(leaks, store);

      await container
          .read(sessionProvider.notifier)
          .end(cause: SessionEndCause.tokenRejected);

      await _expectSignedOut(container, leaks);
      expect(store.removals, 0);
      expect(container.read(sessionNoticeProvider), {
        SessionNotice.sessionEnded,
      });
    });

    test('Given a store that cannot be removed '
        'When the user removes the vault '
        'Then the session still ends, and sign-in says the vault copy is '
        'still on the device', () async {
      final leaks = LeakRecorder();
      final store = FakeDeviceVaultRepository()..removeFails = true;
      final container = await _signedIn(leaks, store);
      final signOut = container.read(signOutControllerProvider.notifier);
      await signOut.request();

      await signOut.removeVault();

      await _expectSignedOut(container, leaks);
      expect(container.read(sessionNoticeProvider), {
        SessionNotice.vaultNotRemoved,
      });
    });

    test(
      'Given a store whose pending edits cannot be counted '
      'When the user removes the vault '
      'Then it is kept, since what removing it loses cannot be stated, the '
      'session still ends, and sign-in says the copy is still there',
      () async {
        final leaks = LeakRecorder();
        final store = FakeDeviceVaultRepository()..countFails = true;
        final container = await _signedIn(leaks, store);
        final signOut = container.read(signOutControllerProvider.notifier);
        await signOut.request();

        await signOut.removeVault();

        await _expectSignedOut(container, leaks);
        expect(store.removals, 0);
        expect(container.read(sessionNoticeProvider), {
          SessionNotice.vaultNotRemoved,
        });
      },
    );

    test('Given signing out under way '
        'When the user asks to sign out again '
        'Then the second request is ignored', () async {
      final leaks = LeakRecorder();
      final container = await _signedIn(leaks, FakeDeviceVaultRepository());
      final signOut = container.read(signOutControllerProvider.notifier);
      await signOut.request();

      await signOut.request();

      expect(
        container.read(signOutControllerProvider),
        const SignOutChoosingStorage(),
      );
    });
  });
}
