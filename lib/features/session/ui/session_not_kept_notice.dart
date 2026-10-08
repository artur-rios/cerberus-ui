/// The notice that secure storage cannot keep a session (UC-03 AF-05).
///
/// Shown by every screen that completes a login — sign-in, and the challenge
/// whose step 6 stores the token as sign-in does. The user decides whether to
/// continue for this run with the token held in memory, or to give it up.
library;

import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

/// Asks whether to continue for this run without a kept session.
class SessionNotKeptNotice extends StatelessWidget {
  const SessionNotKeptNotice({
    super.key,
    required this.onContinue,
    required this.onDiscard,
    this.continueKey,
    this.discardKey,
  });

  final VoidCallback onContinue;
  final VoidCallback onDiscard;
  final Key? continueKey;
  final Key? discardKey;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Semantics(
      liveRegion: true,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.signInSessionNotKeptTitle,
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 8),
              Text(l10n.signInSessionNotKeptBody),
              const SizedBox(height: 12),
              OverflowBar(
                alignment: MainAxisAlignment.end,
                spacing: 8,
                children: [
                  TextButton(
                    key: discardKey,
                    onPressed: onDiscard,
                    child: Text(l10n.signInDiscardSession),
                  ),
                  FilledButton(
                    key: continueKey,
                    onPressed: onContinue,
                    child: Text(l10n.signInContinueForThisRun),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
