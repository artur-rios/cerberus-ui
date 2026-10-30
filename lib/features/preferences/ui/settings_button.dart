/// The way into the preferences (UC-10 step 1).
library;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../l10n/app_localizations.dart';

/// Opens the settings screen, on top of where the user is.
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  static const button = Key('settings.open');

  @override
  Widget build(BuildContext context) => IconButton(
    key: button,
    tooltip: AppLocalizations.of(context).settingsAction,
    icon: const Icon(Icons.settings_outlined),
    onPressed: () => context.push(Routes.settings),
  );
}
