/// Stands in for a screen whose use case is not implemented yet.
///
/// The router reserves the routes the guard sends people to — setup and the
/// second-factor challenge — so that a build is navigable before UC-01 and
/// UC-04 exist. Each use case replaces its route's builder with the real
/// screen.
library;

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'message_screen.dart';

/// States that this screen is not in this version yet.
class PendingFeatureScreen extends StatelessWidget {
  const PendingFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return MessageScreen(
      icon: Icons.construction_outlined,
      title: l10n.appTitle,
      body: l10n.pendingFeatureBody,
    );
  }
}
