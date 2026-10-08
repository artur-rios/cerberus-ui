/// The neutral starting screen (UC-05 step 2, AF-04, `/starting`).
///
/// Shown while a stored session is verified, and when that verification did
/// not complete. It names no account and shows nothing of the vault: until
/// the API has accepted the token there is no session to show anything of.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../l10n/app_localizations.dart';
import '../state/session_restore_controller.dart';

/// Holds the start while the stored session is verified.
class StartingScreen extends ConsumerWidget {
  const StartingScreen({super.key});

  static const progress = Key('starting.progress');
  static const failureMessage = Key('starting.failure');
  static const retryButton = Key('starting.retry');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final state = ref.watch(sessionRestoreProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.startingTitle)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: switch (state) {
              SessionRestoreFailed() && final failed => _FailureNotice(
                failed: failed,
                onRetry: ref.read(sessionRestoreProvider.notifier).retry,
              ),
              _ => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(key: StartingScreen.progress),
                  const SizedBox(height: 16),
                  Text(
                    l10n.startingVerifying,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            },
          ),
        ),
      ),
    );
  }
}

/// A lost connection, or the API's own reason for not verifying (AF-04).
class _FailureNotice extends StatelessWidget {
  const _FailureNotice({required this.failed, required this.onRetry});

  final SessionRestoreFailed failed;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Semantics(
      liveRegion: true,
      child: Card(
        color: colors.errorContainer,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                failed.isConnectionLost
                    ? l10n.startingConnectionLostTitle
                    : l10n.startingNotVerifiedTitle,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: colors.onErrorContainer,
                ),
              ),
              const SizedBox(height: 8),
              SelectableText(
                failed.failure.message,
                key: StartingScreen.failureMessage,
                style: TextStyle(color: colors.onErrorContainer),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  key: StartingScreen.retryButton,
                  onPressed: onRetry,
                  child: Text(l10n.startingRetry),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
