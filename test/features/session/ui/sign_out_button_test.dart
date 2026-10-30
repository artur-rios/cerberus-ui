import 'package:cerberus_ui/app/router.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/config/device_settings.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_notice.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/data/device_vault_repository.dart';
import 'package:cerberus_ui/features/session/ui/sign_in_screen.dart';
import 'package:cerberus_ui/features/session/ui/sign_out_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/fake_device_vault_repository.dart';
import '../../../support/pump_app.dart';
import '../../../support/recording_stores.dart';

class _OnlineOnlyDevice extends DeviceSettingsController {
  @override
  DeviceSettings build() =>
      const DeviceSettings(storageMode: StorageMode.onlineOnly);
}

String _location(ProviderContainer container) => container
    .read(routerProvider)
    .routerDelegate
    .currentConfiguration
    .uri
    .toString();

/// Pumps the application signed in, where the guard puts a signed-in user
/// while the protocol gate is closed.
Future<ProviderContainer> _signedIn(
  WidgetTester tester, {
  FakeDeviceVaultRepository? store,
  RecordingSecureStore? secureStore,
  bool onlineOnly = false,
}) async {
  final container = await pumpCerberusApp(
    tester,
    secureStore: secureStore,
    overrides: [
      deviceVaultRepositoryProvider.overrideWithValue(
        store ?? FakeDeviceVaultRepository(),
      ),
      if (onlineOnly)
        deviceSettingsProvider.overrideWith(_OnlineOnlyDevice.new),
    ],
  );
  await container
      .read(sessionProvider.notifier)
      .establish(token: 'token', accountId: 'acct-1');
  await tester.pumpAndSettle();
  return container;
}

Future<void> _tapSignOut(WidgetTester tester) async {
  await tester.tap(find.byKey(SignOutButton.button));
  await tester.pumpAndSettle();
}

void main() {
  group('SignOutButton', () {
    testWidgets('Given a signed-in user '
        'When the screen they land on is shown '
        'Then signing out is offered there (UC-06 step 1)', (tester) async {
      final container = await _signedIn(tester);

      expect(
        _location(container),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      expect(find.byKey(SignOutButton.button), findsOneWidget);
      expect(find.text('Sign out'), findsOneWidget);
    });

    testWidgets('Given the default mode '
        'When the user chooses to sign out '
        'Then they are asked whether to keep the vault, told the kept copy '
        'is ciphertext only, and cannot start a second sign-out (UC-06 '
        'step 2)', (tester) async {
      await _signedIn(tester);

      await _tapSignOut(tester);

      expect(find.byKey(SignOutButton.storageDialog), findsOneWidget);
      expect(find.textContaining('ciphertext only'), findsOneWidget);
      expect(
        tester.widget<TextButton>(find.byKey(SignOutButton.button)).onPressed,
        isNull,
      );
    });

    testWidgets('Given the question about the store '
        'When the user keeps the vault '
        'Then sign-in is presented, the session is gone and the store stays '
        '(UC-06 steps 3-7)', (tester) async {
      final store = FakeDeviceVaultRepository(pendingEdits: 1);
      final container = await _signedIn(tester, store: store);
      await _tapSignOut(tester);

      await tester.tap(find.byKey(SignOutButton.keepButton));
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
      expect(find.byType(SignInScreen), findsOneWidget);
      expect(container.read(sessionProvider), const SignedOut());
      expect(store.removals, 0);
    });

    testWidgets('Given the question about the store and nothing pending '
        'When the user removes the vault '
        'Then sign-in is presented and the store is gone (UC-06 step 6)', (
      tester,
    ) async {
      final store = FakeDeviceVaultRepository();
      final container = await _signedIn(tester, store: store);
      await _tapSignOut(tester);

      await tester.tap(find.byKey(SignOutButton.removeButton));
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
      expect(store.removals, 1);
    });

    testWidgets('Given three offline edits never uploaded '
        'When the user removes the vault '
        'Then the system states that three edits would be lost and asks '
        'again (UC-06 AF-01)', (tester) async {
      final store = FakeDeviceVaultRepository(pendingEdits: 3);
      final container = await _signedIn(tester, store: store);
      await _tapSignOut(tester);

      await tester.tap(find.byKey(SignOutButton.removeButton));
      await tester.pumpAndSettle();

      expect(find.byKey(SignOutButton.lossDialog), findsOneWidget);
      expect(find.textContaining('3 edits made offline'), findsOneWidget);
      expect(container.read(sessionProvider), isA<SignedIn>());
    });

    testWidgets('Given the warning that edits would be lost '
        'When the user confirms '
        'Then the store is removed and sign-in is presented (UC-06 AF-01)', (
      tester,
    ) async {
      final store = FakeDeviceVaultRepository(pendingEdits: 1);
      final container = await _signedIn(tester, store: store);
      await _tapSignOut(tester);
      await tester.tap(find.byKey(SignOutButton.removeButton));
      await tester.pumpAndSettle();

      expect(find.textContaining('1 edit made offline'), findsOneWidget);
      await tester.tap(find.byKey(SignOutButton.confirmRemovalButton));
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
      expect(store.removals, 1);
    });

    testWidgets('Given the warning that edits would be lost '
        'When the user declines '
        'Then the store is kept and sign-in is presented (UC-06 AF-01)', (
      tester,
    ) async {
      final store = FakeDeviceVaultRepository(pendingEdits: 2);
      final container = await _signedIn(tester, store: store);
      await _tapSignOut(tester);
      await tester.tap(find.byKey(SignOutButton.removeButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(SignOutButton.declineRemovalButton));
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
      expect(store.removals, 0);
      expect(store.pendingEdits, 2);
    });

    testWidgets('Given the question about the store '
        'When the user cancels '
        'Then they stay signed in where they were', (tester) async {
      final container = await _signedIn(tester);
      await _tapSignOut(tester);

      await tester.tap(find.byKey(SignOutButton.cancelButton));
      await tester.pumpAndSettle();

      expect(find.byKey(SignOutButton.storageDialog), findsNothing);
      expect(container.read(sessionProvider), isA<SignedIn>());
      expect(
        tester.widget<TextButton>(find.byKey(SignOutButton.button)).onPressed,
        isNotNull,
      );
    });

    testWidgets('Given an online-only device '
        'When the user chooses to sign out '
        'Then nothing is asked and sign-in is presented (UC-06 AF-02)', (
      tester,
    ) async {
      final store = FakeDeviceVaultRepository(exists: false);
      final container = await _signedIn(tester, store: store, onlineOnly: true);

      await _tapSignOut(tester);

      expect(find.byKey(SignOutButton.storageDialog), findsNothing);
      expect(_location(container), Routes.signIn);
      expect(store.removals, 0);
    });

    testWidgets('Given a token secure storage cannot delete '
        'When the user signs out '
        'Then sign-in is still presented, and reports that the token was not '
        'deleted (UC-06 AF-03)', (tester) async {
      final secureStore = RecordingSecureStore();
      final container = await _signedIn(
        tester,
        secureStore: secureStore,
        onlineOnly: true,
      );
      secureStore.deleteFailure = const SecureStoreUnavailableException('x');

      await _tapSignOut(tester);

      expect(_location(container), Routes.signIn);
      expect(
        find.byKey(SignInScreen.noticeFor(SessionNotice.tokenNotDeleted)),
        findsOneWidget,
      );
      expect(find.textContaining("couldn't delete"), findsOneWidget);
    });

    testWidgets('Given a store that cannot be removed '
        'When the user removes the vault '
        'Then sign-in is still presented, and says the encrypted copy is '
        'still on the device', (tester) async {
      final store = FakeDeviceVaultRepository()..removeFails = true;
      await _signedIn(tester, store: store);
      await _tapSignOut(tester);

      await tester.tap(find.byKey(SignOutButton.removeButton));
      await tester.pumpAndSettle();

      expect(
        find.byKey(SignInScreen.noticeFor(SessionNotice.vaultNotRemoved)),
        findsOneWidget,
      );
      await tester.tap(
        find.byKey(SignInScreen.dismissFor(SessionNotice.vaultNotRemoved)),
      );
      await tester.pumpAndSettle();
      expect(
        find.byKey(SignInScreen.noticeFor(SessionNotice.vaultNotRemoved)),
        findsNothing,
      );
    });

    testWidgets('Given a signed-in user '
        'When the API rejects their token mid-session '
        'Then sign-in is presented without asking about the store, and says '
        'the session ended (UC-06 AF-04)', (tester) async {
      final store = FakeDeviceVaultRepository(pendingEdits: 1);
      final container = await _signedIn(tester, store: store);

      await container
          .read(sessionProvider.notifier)
          .end(cause: SessionEndCause.tokenRejected);
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
      expect(find.byKey(SignOutButton.storageDialog), findsNothing);
      expect(find.byKey(SignInScreen.sessionEndedNotice), findsOneWidget);
      expect(store.removals, 0);
    });
  });
}
