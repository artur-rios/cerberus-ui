/// A route that does not exist (UC-07 AF-05).
library;

import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import 'message_screen.dart';

/// States that there is nothing at the requested address.
class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return MessageScreen(
      icon: Icons.search_off_outlined,
      title: l10n.notFoundTitle,
      body: l10n.notFoundBody,
    );
  }
}
