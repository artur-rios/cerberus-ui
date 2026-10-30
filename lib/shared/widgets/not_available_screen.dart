/// Where the guard sends a route it refuses, saying why (UC-07 AF-03, AF-06).
library;

import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../l10n/app_localizations.dart';
import 'message_screen.dart';

/// States why a route is not available — never pretending it does not exist.
class NotAvailableScreen extends StatelessWidget {
  const NotAvailableScreen({
    required this.reason,
    this.actions = const [],
    super.key,
  });

  final UnavailableReason reason;

  /// What the user can do from here, in the app bar.
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return MessageScreen(
      icon: Icons.lock_clock_outlined,
      title: l10n.notAvailableTitle,
      actions: actions,
      body: switch (reason) {
        UnavailableReason.protocol => l10n.notAvailableProtocol,
        UnavailableReason.storageMode => l10n.notAvailableStorageMode,
        UnavailableReason.deviceProfile => l10n.notAvailableDeviceProfile,
      },
    );
  }
}
