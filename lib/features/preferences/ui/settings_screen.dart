/// Choosing preferences (UC-10, FR-PS-01 … FR-PS-04).
///
/// Shows the current theme, auto-lock timeout and clipboard clearing interval
/// (step 2) and applies each choice at once (steps 3–5); the preferences
/// controller keeps it (step 6). Choosing never for either interval asks
/// first, and applies only after confirmation (AF-01, AF-02). On the web a
/// notice says the choices last for this visit (AF-03); a choice that could
/// not be kept still applies, and the screen says it was not kept (AF-04).
///
/// The two intervals govern locking and copying, which are protocol-dependent
/// (FR-CR-02). While the protocol gate is closed the screen says so beneath
/// them, rather than offering a choice that appears to do something now.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/config/device_settings.dart';
import '../../../core/config/preferences.dart';
import '../../../core/crypto/protocol_gate.dart';
import '../../../core/result/result.dart';
import '../../../l10n/app_localizations.dart';

/// The auto-lock timeouts offered: positive intervals, then never.
const autoLockChoices = [
  PreferenceInterval(Duration(minutes: 1)),
  PreferenceInterval(Duration(minutes: 5)),
  PreferenceInterval(Duration(minutes: 15)),
  PreferenceInterval(Duration(minutes: 30)),
  PreferenceInterval(Duration(hours: 1)),
  PreferenceInterval.never(),
];

/// The clipboard clearing intervals offered: positive intervals, then never.
const clipboardChoices = [
  PreferenceInterval(Duration(seconds: 10)),
  PreferenceInterval(Duration(seconds: 30)),
  PreferenceInterval(Duration(minutes: 1)),
  PreferenceInterval(Duration(minutes: 2)),
  PreferenceInterval.never(),
];

/// The settings screen.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({this.actions = const [], super.key});

  /// What the user can do from here besides choosing, in the app bar.
  final List<Widget> actions;

  static const themeSelector = Key('settings.theme');
  static const autoLockSelector = Key('settings.auto-lock');
  static const clipboardSelector = Key('settings.clipboard');
  static const webNotice = Key('settings.web-notice');
  static const notKeptNotice = Key('settings.not-kept');
  static const waitsForProtocolNotice = Key('settings.waits-for-protocol');
  static const neverDialog = Key('settings.never-dialog');
  static const confirmNeverButton = Key('settings.never-confirm');
  static const cancelNeverButton = Key('settings.never-cancel');

  /// The segment for [mode] in the theme selector.
  static Key themeSegment(ThemeMode mode) => Key('settings.theme.${mode.name}');

  /// The item for [interval] in an interval selector's menu.
  static Key intervalItem(Key selector, PreferenceInterval interval) =>
      ValueKey('$selector.${interval.storedValue}');

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  /// Whether the last choice could not be kept (AF-04). Cleared by the next
  /// choice that is kept.
  bool _notKept = false;

  Future<void> _apply(Future<Result<void>> choice) async {
    final result = await choice;
    if (!mounted) return;
    setState(() => _notKept = !result.isSuccess);
  }

  /// Asks before choosing never, and reports whether the user confirmed.
  Future<bool> _confirmNever({
    required String title,
    required String body,
  }) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        final l10n = AppLocalizations.of(context);
        return AlertDialog(
          key: SettingsScreen.neverDialog,
          title: Text(title),
          content: Text(body),
          actions: [
            TextButton(
              key: SettingsScreen.cancelNeverButton,
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.settingsNeverCancel),
            ),
            FilledButton(
              key: SettingsScreen.confirmNeverButton,
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(l10n.settingsNeverConfirm),
            ),
          ],
        );
      },
    );
    // Dismissing the warning is declining it: the previous interval stays.
    return confirmed ?? false;
  }

  Future<void> _chooseAutoLock(PreferenceInterval interval) async {
    final l10n = AppLocalizations.of(context);
    if (interval.isNever &&
        !await _confirmNever(
          title: l10n.settingsNeverAutoLockTitle,
          body: l10n.settingsNeverAutoLockBody,
        )) {
      return;
    }
    await _apply(
      ref.read(preferencesProvider.notifier).setAutoLockTimeout(interval),
    );
  }

  Future<void> _chooseClipboard(PreferenceInterval interval) async {
    final l10n = AppLocalizations.of(context);
    if (interval.isNever &&
        !await _confirmNever(
          title: l10n.settingsNeverClipboardTitle,
          body: l10n.settingsNeverClipboardBody,
        )) {
      return;
    }
    await _apply(
      ref
          .read(preferencesProvider.notifier)
          .setClipboardClearInterval(interval),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final preferences = ref.watch(preferencesProvider);
    final isWeb = ref.watch(isWebProvider);
    final gateClosed = !ref.watch(protocolGateProvider).isOpen;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle), actions: widget.actions),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              if (isWeb)
                _Notice(
                  key: SettingsScreen.webNotice,
                  icon: Icons.info_outline,
                  text: l10n.settingsWebNotice,
                ),
              if (_notKept)
                _Notice(
                  key: SettingsScreen.notKeptNotice,
                  icon: Icons.warning_amber_outlined,
                  text: l10n.settingsNotKept,
                ),
              Text(l10n.settingsThemeLabel, style: theme.textTheme.titleMedium),
              const SizedBox(height: 8),
              SegmentedButton<ThemeMode>(
                key: SettingsScreen.themeSelector,
                segments: [
                  for (final (mode, label) in [
                    (ThemeMode.light, l10n.settingsThemeLight),
                    (ThemeMode.dark, l10n.settingsThemeDark),
                    (ThemeMode.system, l10n.settingsThemeSystem),
                  ])
                    ButtonSegment(
                      value: mode,
                      label: Text(
                        label,
                        key: SettingsScreen.themeSegment(mode),
                      ),
                    ),
                ],
                selected: {preferences.themeMode},
                onSelectionChanged: (selection) => _apply(
                  ref
                      .read(preferencesProvider.notifier)
                      .setThemeMode(selection.single),
                ),
              ),
              const SizedBox(height: 24),
              _IntervalSetting(
                selectorKey: SettingsScreen.autoLockSelector,
                label: l10n.settingsAutoLockLabel,
                help: l10n.settingsAutoLockHelp,
                choices: autoLockChoices,
                current: preferences.autoLockTimeout,
                waitsForProtocol: gateClosed,
                onChosen: _chooseAutoLock,
              ),
              const SizedBox(height: 24),
              _IntervalSetting(
                selectorKey: SettingsScreen.clipboardSelector,
                label: l10n.settingsClipboardLabel,
                help: l10n.settingsClipboardHelp,
                choices: clipboardChoices,
                current: preferences.clipboardClearInterval,
                waitsForProtocol: gateClosed,
                onChosen: _chooseClipboard,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// One interval preference: its label, what it does, and its choices.
class _IntervalSetting extends StatelessWidget {
  const _IntervalSetting({
    required this.selectorKey,
    required this.label,
    required this.help,
    required this.choices,
    required this.current,
    required this.waitsForProtocol,
    required this.onChosen,
  });

  final Key selectorKey;
  final String label;
  final String help;
  final List<PreferenceInterval> choices;
  final PreferenceInterval current;
  final bool waitsForProtocol;
  final ValueChanged<PreferenceInterval> onChosen;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    // A value restored from an earlier run is shown even when it is not one
    // of the choices offered here, rather than being misreported as another.
    final offered = [...choices, if (!choices.contains(current)) current];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleMedium),
        const SizedBox(height: 4),
        Text(help, style: theme.textTheme.bodyMedium),
        const SizedBox(height: 8),
        DropdownButton<PreferenceInterval>(
          key: selectorKey,
          value: current,
          items: [
            for (final interval in offered)
              DropdownMenuItem(
                key: SettingsScreen.intervalItem(selectorKey, interval),
                value: interval,
                child: Text(describeInterval(l10n, interval)),
              ),
          ],
          onChanged: (interval) {
            if (interval != null && interval != current) onChosen(interval);
          },
        ),
        if (waitsForProtocol) ...[
          const SizedBox(height: 4),
          Text(
            l10n.settingsWaitsForProtocol,
            key: ValueKey('${SettingsScreen.waitsForProtocolNotice}.$label'),
            style: theme.textTheme.bodySmall,
          ),
        ],
      ],
    );
  }
}

/// A notice above the preferences.
class _Notice extends StatelessWidget {
  const _Notice({required this.icon, required this.text, super.key});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 24),
    child: ListTile(leading: Icon(icon), title: Text(text)),
  );
}

/// [interval] as the user reads it: in hours, minutes or seconds, whichever
/// states it exactly, or never.
String describeInterval(AppLocalizations l10n, PreferenceInterval interval) {
  final duration = interval.duration;
  if (duration == null) return l10n.settingsIntervalNever;
  final seconds = duration.inSeconds;
  if (seconds % Duration.secondsPerHour == 0) {
    return l10n.settingsIntervalHours(seconds ~/ Duration.secondsPerHour);
  }
  if (seconds % Duration.secondsPerMinute == 0) {
    return l10n.settingsIntervalMinutes(seconds ~/ Duration.secondsPerMinute);
  }
  return l10n.settingsIntervalSeconds(seconds);
}
