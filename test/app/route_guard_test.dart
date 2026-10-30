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
  bool startHeld = false,
}) => GuardState(
  instanceConfigured: configured,
  session: session,
  vault: vault,
  protocolGateOpen: gateOpen,
  device: DeviceSettings(storageMode: mode, deviceProfileId: deviceProfileId),
  startHeld: startHeld,
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
        'Then it goes to sign-in, remembering the route asked for (UC-07 '
        'step 5)', () {
      for (final location in [
        Routes.settings,
        '/records/r-1',
        '/records/r-1?tab=fields',
        '/no/such/route',
      ]) {
        expect(
          _redirect(_state(), location),
          Routes.carrying(Routes.signIn, location),
          reason: location,
        );
      }
    });

    test('Given no session '
        'When home, the challenge or unlock is requested '
        'Then it goes to sign-in remembering nothing, because none of them is '
        'a destination worth returning to', () {
      for (final location in [Routes.home, Routes.challenge, Routes.unlock]) {
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
      for (final location in [Routes.home, Routes.unlock]) {
        expect(
          _redirect(_state(session: _challenge), location),
          Routes.signIn,
          reason: location,
        );
      }
      expect(
        _redirect(_state(session: _challenge), Routes.settings),
        Routes.carrying(Routes.signIn, Routes.settings),
      );
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
      // Protection exists, so setup has nothing to do: on to where home
      // sends a locked vault, in one answer.
      expect(_redirect(state, Routes.vaultSetup), Routes.unlock);
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

  group('resolveRedirect — a stored session verified at start (UC-05)', () {
    test('Given a stored session being verified '
        'When any route is requested '
        'Then it is held on the starting screen, remembering where it was '
        'going — nothing that depends on the session is shown (step 2)', () {
      final state = _state(startHeld: true);

      expect(_redirect(state, Routes.home), Routes.starting);
      expect(
        _redirect(state, Routes.signIn),
        Routes.startingFor(Uri.parse(Routes.signIn)),
      );
      expect(
        _redirect(state, '/records/r-1'),
        Routes.startingFor(Uri.parse('/records/r-1')),
      );
      expect(_redirect(state, Routes.starting), isNull);
      expect(
        _redirect(state, Routes.startingFor(Uri.parse('/records'))),
        isNull,
      );
    });

    test('Given no instance '
        'When the start is held '
        'Then setup still comes first', () {
      expect(
        _redirect(_state(configured: false, startHeld: true), Routes.home),
        Routes.setup,
      );
    });

    test('Given the verification settled '
        'When the starting screen is current '
        'Then the user goes on to where they were going, or home — as the '
        'rest of the guard decides it, in one answer (step 6)', () {
      final settled = _state(session: _signedIn);

      expect(
        _redirect(
          settled,
          Routes.startingFor(Uri.parse(Routes.accountSettings)),
        ),
        Routes.accountSettings,
      );
      // The gate refuses vault routes, and home, as ever.
      expect(
        _redirect(settled, Routes.startingFor(Uri.parse('/records'))),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      expect(
        _redirect(settled, Routes.starting),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      // Signed out — a discarded session — it is sign-in, still remembering
      // where the user was going (UC-07 step 5).
      expect(
        _redirect(_state(), Routes.startingFor(Uri.parse('/records'))),
        Routes.carrying(Routes.signIn, '/records'),
      );
    });

    test('Given a restored session whose account has no protection '
        'When home is requested '
        'Then the closed gate refuses setup as it refuses unlock '
        '(step 6, FR-CR-02)', () {
      final state = _state(
        session: const SignedIn(accountId: null),
        vault: const VaultProtectionUninitialized(),
      );

      expect(
        _redirect(state, Routes.home),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      expect(
        _redirect(state, Routes.vaultSetup),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
    });
  });

  group('resolveRedirect — remembered routes (UC-07 steps 5 and 7)', () {
    test('Given a route remembered on the way to sign-in '
        'When the session is established '
        'Then the remembered route is opened through the guard again', () {
      final signedIn = _state(session: _signedIn);

      expect(
        _redirect(signedIn, Routes.carrying(Routes.signIn, Routes.settings)),
        Routes.settings,
      );
      // Through the guard again: the closed gate still refuses a vault route.
      expect(
        _redirect(signedIn, Routes.carrying(Routes.signIn, '/records/r-1')),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      // And with the gate open and the vault unlocked, it is the route itself.
      expect(
        _redirect(
          _state(session: _signedIn, vault: _unlocked, gateOpen: true),
          Routes.carrying(Routes.signIn, '/records/r-1?tab=fields'),
        ),
        '/records/r-1?tab=fields',
      );
    });

    test('Given a route remembered on the way to sign-in '
        'When the sign-in is challenged, abandoned or completed '
        'Then the challenge carries it, sign-in again keeps it and the '
        'completed session opens it', () {
      final atChallenge = Routes.carrying(Routes.challenge, Routes.settings);

      expect(_redirect(_state(session: _challenge), atChallenge), isNull);
      expect(
        _redirect(_state(), atChallenge),
        Routes.carrying(Routes.signIn, Routes.settings),
      );
      expect(
        _redirect(_state(session: _signedIn), atChallenge),
        Routes.settings,
      );
    });

    test('Given an open gate and a locked vault '
        'When a vault route is requested and the vault is then unlocked '
        'Then unlock remembers it and opens it afterwards', () {
      const route = '/records/r-1';
      final atUnlock = Routes.carrying(Routes.unlock, route);

      expect(
        _redirect(_state(session: _signedIn, gateOpen: true), route),
        atUnlock,
      );
      expect(
        _redirect(_state(session: _signedIn, gateOpen: true), atUnlock),
        isNull,
      );
      expect(
        _redirect(
          _state(session: _signedIn, vault: _unlocked, gateOpen: true),
          atUnlock,
        ),
        route,
      );
    });

    test('Given an open gate and no protection '
        'When a vault route is requested and protection is then initialized '
        'Then setup remembers it, and unlock follows still remembering it', () {
      const route = '/folders/f-1';
      final atSetup = Routes.carrying(Routes.vaultSetup, route);

      expect(
        _redirect(
          _state(
            session: _signedIn,
            gateOpen: true,
            vault: const VaultProtectionUninitialized(),
          ),
          route,
        ),
        atSetup,
      );
      expect(
        _redirect(_state(session: _signedIn, gateOpen: true), atSetup),
        Routes.carrying(Routes.unlock, route),
      );
    });

    test('Given a remembered route that is not a location in this application '
        'When the session is established '
        'Then it is not followed, and the user goes where home would send '
        'them', () {
      final signedIn = _state(session: _signedIn);
      final home = _redirect(signedIn, Routes.signIn);

      for (final target in [
        'https://elsewhere.example/steal',
        '//elsewhere.example/steal',
        'records/r-1',
        Routes.signIn,
        Routes.starting,
        Routes.carrying(Routes.unlock, '/records/r-1'),
        Routes.unavailable,
      ]) {
        expect(
          _redirect(
            signedIn,
            Uri(
              path: Routes.signIn,
              queryParameters: {Routes.continueParameter: target},
            ).toString(),
          ),
          home,
          reason: target,
        );
      }
    });

    test('Given a signed-in user on the not-available screen '
        'When the session ends '
        'Then sign-in remembers nothing, because that screen is only where the '
        'guard lands people', () {
      expect(
        _redirect(_state(), Routes.unavailableFor(UnavailableReason.protocol)),
        Routes.signIn,
      );
    });
  });

  group('resolveRedirect — profiles (UC-07 AF-02, AF-03)', () {
    final open = _state(session: _signedIn, vault: _unlocked, gateOpen: true);

    test('Given a profile open '
        'When another profile\'s content is requested '
        'Then the guard sends the user to unlock that profile, never showing '
        'it under the open one (AF-02)', () {
      const other = '/profiles/profile-2';

      expect(_redirect(open, other), Routes.carrying(Routes.unlock, other));
      expect(_redirect(open, Routes.carrying(Routes.unlock, other)), isNull);
      expect(_redirect(open, '/profiles/profile-1'), isNull);
      expect(_redirect(open, Routes.profiles), isNull);
      // Once that profile is open, the remembered route follows.
      expect(
        _redirect(
          _state(
            session: _signedIn,
            vault: const VaultUnlocked(profileId: 'profile-2'),
            gateOpen: true,
          ),
          Routes.carrying(Routes.unlock, other),
        ),
        other,
      );
    });

    test('Given a device restricted to a profile '
        'When content outside it is requested, however it is reached '
        'Then it is refused with a not-available notice, and navigation does '
        'not lift the restriction (AF-03)', () {
      const outside = '/profiles/profile-2';
      final refused = Routes.unavailableFor(UnavailableReason.deviceProfile);
      final restricted = _state(
        session: _signedIn,
        vault: _unlocked,
        gateOpen: true,
        deviceProfileId: 'profile-1',
      );

      for (final location in [
        outside,
        Routes.carrying(Routes.unlock, outside),
        Routes.carrying(Routes.signIn, outside),
        Routes.carrying(Routes.challenge, outside),
        Routes.startingFor(Uri.parse(outside)),
      ]) {
        expect(_redirect(restricted, location), refused, reason: location);
      }
      expect(
        _redirect(
          _state(
            session: _signedIn,
            gateOpen: true,
            deviceProfileId: 'profile-1',
          ),
          outside,
        ),
        refused,
      );
    });
  });

  group('resolveRedirect — what client state cannot unlock (UC-07 AF-04, '
      'AF-05, AF-06)', () {
    test(
      'Given client state claiming an unlocked vault '
      'When a vault route is requested while the gate is closed '
      'Then it is still refused: the gate is not client state (FR-DA-10)',
      () {
        for (final location in [Routes.home, '/records/r-1', Routes.trash]) {
          expect(
            _redirect(_state(session: _signedIn, vault: _unlocked), location),
            Routes.unavailableFor(UnavailableReason.protocol),
            reason: location,
          );
        }
      },
    );

    test('Given a session '
        'When an address no route names is requested '
        'Then the guard admits it to the not-found screen, as it would any '
        'signed-in route; beneath a vault route it is refused like the vault '
        '(AF-05)', () {
      expect(_redirect(_state(session: _signedIn), '/no/such/route'), isNull);
      expect(
        _redirect(_state(session: _signedIn), '/records/r-1/no/such'),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
    });

    test('Given the closed gate '
        'When a protocol-dependent route is remembered and then opened '
        'Then it is refused with the protocol reason (AF-06)', () {
      expect(
        _redirect(
          _state(session: _signedIn),
          Routes.carrying(Routes.signIn, Routes.securitySettings),
        ),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
    });
  });
}
