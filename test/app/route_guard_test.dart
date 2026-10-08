import 'package:cerberus_ui/app/route_guard.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/config/device_settings.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/session/vault_state.dart';
import 'package:flutter_test/flutter_test.dart';

const _signedIn = SignedIn(accountId: 'acct-1');
const _challenge = ChallengePending(challengeToken: 't', methods: ['totp']);
const _unlocked = VaultUnlocked(profileId: 'profile-1');

GuardState _state({
  bool configured = true,
  SessionState session = const SignedOut(),
  VaultState vault = const VaultLocked(),
  bool gateOpen = false,
  StorageMode mode = StorageMode.defaultMode,
  String? deviceProfileId,
}) => GuardState(
  instanceConfigured: configured,
  session: session,
  vault: vault,
  protocolGateOpen: gateOpen,
  device: DeviceSettings(storageMode: mode, deviceProfileId: deviceProfileId),
);

String? _redirect(GuardState state, String location) =>
    resolveRedirect(state, Uri.parse(location));

void main() {
  group('resolveRedirect — instance', () {
    test('Given no instance '
        'When any route is requested '
        'Then setup comes first, even before sign-in', () {
      for (final location in [Routes.home, Routes.signIn, Routes.settings]) {
        expect(_redirect(_state(configured: false), location), Routes.setup);
      }
    });

    test('Given no instance '
        'When setup is requested '
        'Then it is admitted, so the redirect cannot loop', () {
      expect(_redirect(_state(configured: false), Routes.setup), isNull);
    });
  });

  group('resolveRedirect — session', () {
    test('Given no session '
        'When an anonymous route is requested '
        'Then it is admitted', () {
      for (final location in Routes.anonymous) {
        expect(_redirect(_state(), location), isNull, reason: location);
      }
    });

    test('Given no session '
        'When anything else is requested, by typed URL included '
        'Then it goes to sign-in', () {
      for (final location in [
        Routes.home,
        Routes.challenge,
        Routes.settings,
        Routes.unlock,
        '/records/r-1',
        '/no/such/route',
      ]) {
        expect(_redirect(_state(), location), Routes.signIn, reason: location);
      }
    });

    test('Given a pending challenge '
        'When the challenge is requested '
        'Then it is admitted', () {
      expect(_redirect(_state(session: _challenge), Routes.challenge), isNull);
    });

    test('Given a pending challenge '
        'When a signed-in route is requested '
        'Then it behaves as signed out (FR-SE-04)', () {
      for (final location in [Routes.home, Routes.settings, Routes.unlock]) {
        expect(
          _redirect(_state(session: _challenge), location),
          Routes.signIn,
          reason: location,
        );
      }
      expect(_redirect(_state(session: _challenge), Routes.signIn), isNull);
    });

    test('Given a session and an unlocked vault '
        'When sign-in or the challenge is requested '
        'Then it goes home', () {
      for (final location in [
        Routes.signIn,
        Routes.register,
        Routes.challenge,
      ]) {
        expect(
          _redirect(
            _state(session: _signedIn, vault: _unlocked, gateOpen: true),
            location,
          ),
          Routes.home,
          reason: location,
        );
      }
    });

    test('Given a session and a locked vault '
        'When sign-in is requested '
        'Then it goes straight to where home would send it', () {
      expect(
        _redirect(_state(session: _signedIn, gateOpen: true), Routes.signIn),
        Routes.unlock,
      );
      expect(
        _redirect(_state(session: _signedIn), Routes.signIn),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
    });

    test('Given a session, locked '
        'When a signed-in route is requested '
        'Then it is admitted', () {
      for (final location in [
        Routes.settings,
        Routes.deviceSettings,
        Routes.accountSettings,
        Routes.unavailable,
      ]) {
        expect(
          _redirect(_state(session: _signedIn), location),
          isNull,
          reason: location,
        );
      }
    });
  });

  group('resolveRedirect — protocol gate', () {
    test('Given a closed gate '
        'When any protocol-dependent route is requested '
        'Then it refuses with the protocol reason (FR-CR-02)', () {
      for (final location in [
        Routes.home,
        Routes.unlock,
        Routes.vaultSetup,
        Routes.recover,
        '/records/r-1',
        Routes.securitySettings,
        Routes.privacySettings,
      ]) {
        expect(
          _redirect(_state(session: _signedIn, vault: _unlocked), location),
          Routes.unavailableFor(UnavailableReason.protocol),
          reason: location,
        );
      }
    });

    test('Given an open gate and an unlocked vault '
        'When a vault route is requested '
        'Then it is admitted', () {
      expect(
        _redirect(
          _state(session: _signedIn, vault: _unlocked, gateOpen: true),
          '/records/r-1',
        ),
        isNull,
      );
    });
  });

  group('resolveRedirect — vault lock state', () {
    test('Given an open gate and a locked vault '
        'When a vault route is requested '
        'Then it goes to unlock', () {
      expect(
        _redirect(_state(session: _signedIn, gateOpen: true), Routes.home),
        Routes.unlock,
      );
    });

    test('Given an open gate and no protection '
        'When a vault route or unlock is requested '
        'Then it goes to protection setup', () {
      final state = _state(
        session: _signedIn,
        gateOpen: true,
        vault: const VaultProtectionUninitialized(),
      );

      expect(_redirect(state, Routes.home), Routes.vaultSetup);
      expect(_redirect(state, Routes.unlock), Routes.vaultSetup);
      expect(_redirect(state, Routes.vaultSetup), isNull);
    });

    test('Given an open gate and an unlocked vault '
        'When unlock or protection setup is requested '
        'Then it goes home', () {
      final state = _state(
        session: _signedIn,
        gateOpen: true,
        vault: _unlocked,
      );

      expect(_redirect(state, Routes.unlock), Routes.home);
      expect(_redirect(state, Routes.vaultSetup), Routes.home);
    });

    test('Given an open gate and a locked vault '
        'When unlock or recovery is requested '
        'Then it is admitted', () {
      final state = _state(session: _signedIn, gateOpen: true);

      expect(_redirect(state, Routes.unlock), isNull);
      expect(_redirect(state, Routes.recover), isNull);
      expect(_redirect(state, Routes.vaultSetup), Routes.home);
    });
  });

  group('resolveRedirect — device', () {
    test('Given an online-only device '
        'When synchronization is requested '
        'Then it refuses with the storage-mode reason', () {
      expect(
        _redirect(
          _state(
            session: _signedIn,
            vault: _unlocked,
            gateOpen: true,
            mode: StorageMode.onlineOnly,
          ),
          Routes.sync,
        ),
        Routes.unavailableFor(UnavailableReason.storageMode),
      );
    });

    test('Given a device in the default mode '
        'When synchronization is requested '
        'Then it is admitted', () {
      expect(
        _redirect(
          _state(session: _signedIn, vault: _unlocked, gateOpen: true),
          Routes.sync,
        ),
        isNull,
      );
    });

    test('Given a device restricted to a profile '
        "When another profile's content is requested "
        'Then it refuses with the device-profile reason (UC-07 AF-03)', () {
      final state = _state(
        session: _signedIn,
        vault: _unlocked,
        gateOpen: true,
        deviceProfileId: 'profile-1',
      );

      expect(
        _redirect(state, '/profiles/profile-2'),
        Routes.unavailableFor(UnavailableReason.deviceProfile),
      );
      expect(_redirect(state, '/profiles/profile-1'), isNull);
      expect(_redirect(state, Routes.profiles), isNull);
    });
  });
}
