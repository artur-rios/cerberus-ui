import 'package:cerberus_ui/app/router.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/config/preferences.dart';
import 'package:cerberus_ui/core/crypto/protocol_gate.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/features/preferences/ui/settings_screen.dart';
import 'package:cerberus_ui/l10n/app_localizations_en.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/pump_app.dart';
import '../../../support/recording_stores.dart';

final _l10n = AppLocalizationsEn();

/// Pumps the application signed in, on the settings screen.
Future<ProviderContainer> _onSettings(
  WidgetTester tester, {
  RecordingPreferencesStore? preferences,
  RecordingSecureStore? secureStore,
  bool isWeb = false,
  List<Override> overrides = const [],
}) async {
  final container = await pumpCerberusApp(
    tester,
    preferences: preferences,
    secureStore: secureStore,
    isWeb: isWeb,
    overrides: overrides,
  );
  await container
      .read(sessionProvider.notifier)
      .establish(token: 'token', accountId: 'acct-1');
  await tester.pumpAndSettle();
  container.read(routerProvider).go(Routes.settings);
  await tester.pumpAndSettle();
  expect(find.byType(SettingsScreen), findsOneWidget);
  return container;
}

Future<void> _choose(
  WidgetTester tester,
  Key selector,
  PreferenceInterval interval,
) async {
  await tester.tap(find.byKey(selector));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(SettingsScreen.intervalItem(selector, interval)));
  await tester.pumpAndSettle();
}

String _selectedText(WidgetTester tester, Key selector) {
  final dropdown = tester.widget<DropdownButton<PreferenceInterval>>(
    find.byKey(selector),
  );
  return describeInterval(_l10n, dropdown.value!);
}

Brightness _renderedBrightness(WidgetTester tester) =>
    Theme.of(tester.element(find.byType(SettingsScreen))).brightness;

void main() {
  group('SettingsScreen', () {
    testWidgets('Given nothing chosen yet '
        'When settings are opened '
        'Then the current theme, auto-lock timeout and clipboard interval are '
        'shown — the defaults (step 2)', (tester) async {
      await _onSettings(tester);

      final themes = tester.widget<SegmentedButton<ThemeMode>>(
        find.byKey(SettingsScreen.themeSelector),
      );
      expect(themes.selected, {ThemeMode.system});
      expect(
        _selectedText(tester, SettingsScreen.autoLockSelector),
        '5 minutes',
      );
      expect(
        _selectedText(tester, SettingsScreen.clipboardSelector),
        '30 seconds',
      );
    });

    testWidgets('Given preferences kept from an earlier run '
        'When settings are opened '
        'Then those are shown, including one not among the choices '
        'offered', (tester) async {
      final store = RecordingPreferencesStore()
        ..values[PreferenceKey.autoLockTimeout] = '600'
        ..values[PreferenceKey.clipboardClearInterval] = 'never';
      final container = await pumpCerberusApp(tester, preferences: store);
      await container.read(preferencesProvider.notifier).restore();
      await container
          .read(sessionProvider.notifier)
          .establish(token: 'token', accountId: 'acct-1');
      await tester.pumpAndSettle();

      container.read(routerProvider).go(Routes.settings);
      await tester.pumpAndSettle();

      expect(
        _selectedText(tester, SettingsScreen.autoLockSelector),
        '10 minutes',
      );
      expect(_selectedText(tester, SettingsScreen.clipboardSelector), 'Never');
    });

    testWidgets('Given the system theme '
        'When dark and then light are chosen '
        'Then the application re-renders in each at once and the choice is '
        'kept (step 3)', (tester) async {
      final store = RecordingPreferencesStore();
      await _onSettings(tester, preferences: store);

      await tester.tap(find.byKey(SettingsScreen.themeSegment(ThemeMode.dark)));
      await tester.pumpAndSettle();
      expect(_renderedBrightness(tester), Brightness.dark);

      await tester.tap(
        find.byKey(SettingsScreen.themeSegment(ThemeMode.light)),
      );
      await tester.pumpAndSettle();
      expect(_renderedBrightness(tester), Brightness.light);
      expect(store.values[PreferenceKey.themeMode], 'light');
    });

    testWidgets('Given the defaults '
        'When an auto-lock timeout and a clipboard interval are chosen '
        'Then both apply and are kept (steps 4–6)', (tester) async {
      final store = RecordingPreferencesStore();
      final container = await _onSettings(tester, preferences: store);

      await _choose(
        tester,
        SettingsScreen.autoLockSelector,
        const PreferenceInterval(Duration(minutes: 15)),
      );
      await _choose(
        tester,
        SettingsScreen.clipboardSelector,
        const PreferenceInterval(Duration(minutes: 2)),
      );

      expect(
        container.read(preferencesProvider),
        const Preferences(
          themeMode: ThemeMode.system,
          autoLockTimeout: PreferenceInterval(Duration(minutes: 15)),
          clipboardClearInterval: PreferenceInterval(Duration(minutes: 2)),
        ),
      );
      expect(store.values[PreferenceKey.autoLockTimeout], '900');
      expect(store.values[PreferenceKey.clipboardClearInterval], '120');
      expect(
        _selectedText(tester, SettingsScreen.autoLockSelector),
        '15 minutes',
      );
      expect(find.byKey(SettingsScreen.notKeptNotice), findsNothing);
    });

    testWidgets('Given the auto-lock choices '
        'When never is chosen '
        'Then a warning says an unattended device would stay unlocked, and '
        'declining it keeps the previous timeout (AF-01)', (tester) async {
      final store = RecordingPreferencesStore();
      final container = await _onSettings(tester, preferences: store);

      await _choose(
        tester,
        SettingsScreen.autoLockSelector,
        const PreferenceInterval.never(),
      );

      expect(find.byKey(SettingsScreen.neverDialog), findsOneWidget);
      expect(find.text(_l10n.settingsNeverAutoLockBody), findsOneWidget);

      await tester.tap(find.byKey(SettingsScreen.cancelNeverButton));
      await tester.pumpAndSettle();

      expect(
        container.read(preferencesProvider).autoLockTimeout,
        Preferences.defaults.autoLockTimeout,
      );
      expect(store.writes, isEmpty);
      expect(
        _selectedText(tester, SettingsScreen.autoLockSelector),
        '5 minutes',
      );
    });

    testWidgets('Given the warning about never auto-locking '
        'When it is confirmed '
        'Then never applies and is kept (AF-01)', (tester) async {
      final store = RecordingPreferencesStore();
      final container = await _onSettings(tester, preferences: store);

      await _choose(
        tester,
        SettingsScreen.autoLockSelector,
        const PreferenceInterval.never(),
      );
      await tester.tap(find.byKey(SettingsScreen.confirmNeverButton));
      await tester.pumpAndSettle();

      expect(container.read(preferencesProvider).autoLockTimeout.isNever, true);
      expect(store.values[PreferenceKey.autoLockTimeout], 'never');
      expect(_selectedText(tester, SettingsScreen.autoLockSelector), 'Never');
    });

    testWidgets('Given the clipboard choices '
        'When never is chosen and the warning dismissed '
        'Then the warning said copied secrets stay readable by other '
        'applications, and the previous interval stays (AF-02)', (
      tester,
    ) async {
      final store = RecordingPreferencesStore();
      final container = await _onSettings(tester, preferences: store);

      await _choose(
        tester,
        SettingsScreen.clipboardSelector,
        const PreferenceInterval.never(),
      );
      expect(find.text(_l10n.settingsNeverClipboardBody), findsOneWidget);

      await tester.tapAt(Offset.zero);
      await tester.pumpAndSettle();

      expect(find.byKey(SettingsScreen.neverDialog), findsNothing);
      expect(
        container.read(preferencesProvider).clipboardClearInterval,
        Preferences.defaults.clipboardClearInterval,
      );
      expect(store.writes, isEmpty);
    });

    testWidgets('Given the warning about never clearing the clipboard '
        'When it is confirmed '
        'Then never applies and is kept (AF-02)', (tester) async {
      final store = RecordingPreferencesStore();
      final container = await _onSettings(tester, preferences: store);

      await _choose(
        tester,
        SettingsScreen.clipboardSelector,
        const PreferenceInterval.never(),
      );
      await tester.tap(find.byKey(SettingsScreen.confirmNeverButton));
      await tester.pumpAndSettle();

      expect(
        container.read(preferencesProvider).clipboardClearInterval.isNever,
        isTrue,
      );
      expect(store.values[PreferenceKey.clipboardClearInterval], 'never');
    });

    testWidgets('Given the web '
        'When settings are opened '
        'Then a notice says the preferences last only for this visit '
        '(AF-03)', (tester) async {
      await _onSettings(tester, isWeb: true);

      expect(find.byKey(SettingsScreen.webNotice), findsOneWidget);
      expect(find.text(_l10n.settingsWebNotice), findsOneWidget);
    });

    testWidgets('Given a desktop or Android device '
        'When settings are opened '
        'Then no visit-only notice is shown', (tester) async {
      await _onSettings(tester);

      expect(find.byKey(SettingsScreen.webNotice), findsNothing);
    });

    testWidgets('Given preference storage that cannot be written '
        'When a theme is chosen '
        'Then it applies for this run and the screen reports it was not '
        'kept; a later choice that is kept clears the report (AF-04)', (
      tester,
    ) async {
      final store = RecordingPreferencesStore()
        ..writeFailure = Exception('unwritable');
      await _onSettings(tester, preferences: store);

      await tester.tap(find.byKey(SettingsScreen.themeSegment(ThemeMode.dark)));
      await tester.pumpAndSettle();

      expect(_renderedBrightness(tester), Brightness.dark);
      expect(find.byKey(SettingsScreen.notKeptNotice), findsOneWidget);
      expect(find.text(_l10n.settingsNotKept), findsOneWidget);

      store.writeFailure = null;
      await _choose(
        tester,
        SettingsScreen.autoLockSelector,
        const PreferenceInterval(Duration(minutes: 1)),
      );

      expect(find.byKey(SettingsScreen.notKeptNotice), findsNothing);
    });

    testWidgets('Given the closed protocol gate '
        'When settings are opened '
        'Then the auto-lock and clipboard choices say they take effect once '
        'the vault can be unlocked (FR-CR-02)', (tester) async {
      await _onSettings(tester);

      expect(find.text(_l10n.settingsWaitsForProtocol), findsNWidgets(2));
    });

    testWidgets('Given an open protocol gate '
        'When settings are opened '
        'Then no choice says it waits for the protocol', (tester) async {
      await _onSettings(
        tester,
        overrides: [
          protocolGateProvider.overrideWithValue(
            const ProtocolGate(approvedVersion: 'cerberus-v1'),
          ),
        ],
      );

      expect(find.text(_l10n.settingsWaitsForProtocol), findsNothing);
    });

    testWidgets('Given a session token '
        'When every preference is chosen '
        'Then preference storage holds the three preferences and nothing '
        'else — no token, no account (leak rule, IR-07)', (tester) async {
      const marker = 'TOKEN-MARKER-7f3a';
      final store = RecordingPreferencesStore();
      final secureStore = RecordingSecureStore();
      final container = await pumpCerberusApp(
        tester,
        preferences: store,
        secureStore: secureStore,
      );
      await container
          .read(sessionProvider.notifier)
          .establish(token: marker, accountId: 'acct-marker');
      await tester.pumpAndSettle();
      container.read(routerProvider).go(Routes.settings);
      await tester.pumpAndSettle();

      await tester.tap(find.byKey(SettingsScreen.themeSegment(ThemeMode.dark)));
      await tester.pumpAndSettle();
      await _choose(
        tester,
        SettingsScreen.autoLockSelector,
        const PreferenceInterval(Duration(hours: 1)),
      );
      await _choose(
        tester,
        SettingsScreen.clipboardSelector,
        const PreferenceInterval(Duration(seconds: 10)),
      );

      expect(store.writes, [
        'cerberus.preference.themeMode=dark',
        'cerberus.preference.autoLockTimeout=3600',
        'cerberus.preference.clipboardClearInterval=10',
      ]);
      expect(store.writes.join(), isNot(contains(marker)));
      expect(store.writes.join(), isNot(contains('acct-marker')));
      expect(secureStore.writes.join(), contains(marker));
    });
  });

  group('describeInterval', () {
    test('Given intervals in seconds, minutes and hours, and never '
        'When each is described '
        'Then it is stated in the largest unit that states it exactly', () {
      expect(
        describeInterval(_l10n, const PreferenceInterval(Duration(seconds: 1))),
        '1 second',
      );
      expect(
        describeInterval(
          _l10n,
          const PreferenceInterval(Duration(seconds: 90)),
        ),
        '90 seconds',
      );
      expect(
        describeInterval(_l10n, const PreferenceInterval(Duration(minutes: 1))),
        '1 minute',
      );
      expect(
        describeInterval(_l10n, const PreferenceInterval(Duration(hours: 2))),
        '2 hours',
      );
      expect(
        describeInterval(_l10n, const PreferenceInterval.never()),
        'Never',
      );
    });
  });
}
