/// The sign-in screen (UC-03, `/sign-in`).
///
/// Shows the API's own reason for any refusal (FR-DA-06), and suggests nothing
/// the API did not say: not whether the email exists (AF-01), and nothing
/// about the account's state that a refusal did not report (AF-04). Where a
/// session leads is the guard's decision, not this screen's (step 7). It also
/// says how the last session ended, when there is something to say: the API
/// rejected it (UC-05 AF-02, UC-06 AF-04), its token could not be deleted
/// (UC-06 AF-03), or the vault could not be removed from the device.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes.dart';
import '../../../core/session/session_notice.dart';
import '../../../l10n/app_localizations.dart';
import '../state/sign_in_controller.dart';
import 'session_not_kept_notice.dart';

/// Signs the user in with an email and a password.
class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  static const emailField = Key('sign-in.email');
  static const passwordField = Key('sign-in.password');
  static const submitButton = Key('sign-in.submit');
  static const progress = Key('sign-in.progress');
  static const failureMessage = Key('sign-in.failure');
  static const retryButton = Key('sign-in.retry');
  static const continueButton = Key('sign-in.continue');
  static const discardButton = Key('sign-in.discard');
  static const sessionEndedNotice = Key('sign-in.notice.sessionEnded');
  static const dismissNoticeButton = Key('sign-in.notice.sessionEnded.dismiss');

  /// The card showing [notice].
  static Key noticeFor(SessionNotice notice) =>
      Key('sign-in.notice.${notice.name}');

  /// The button dismissing [notice].
  static Key dismissFor(SessionNotice notice) =>
      Key('sign-in.notice.${notice.name}.dismiss');

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  // Disposed with the screen, which is what clears the credentials when it is
  // left (FR-SE-07).
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _email.addListener(_onFieldChanged);
    _password.addListener(_onFieldChanged);
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  void _onFieldChanged() => setState(() {});

  bool get _canSubmit =>
      _email.text.trim().isNotEmpty && _password.text.isNotEmpty;

  Future<void> _submit() async {
    if (!_canSubmit) return;
    ref.read(sessionNoticeProvider.notifier).clear();
    await ref
        .read(signInControllerProvider.notifier)
        .submit(email: _email.text.trim(), password: _password.text);
  }

  void _onStateChanged(SignInState? previous, SignInState next) {
    switch (next) {
      // Step 6: the credentials are cleared once the API has answered with a
      // session or a challenge. Step 7 is the guard's: it re-evaluates as soon
      // as the session changes.
      case SignInCompletedState() || SignInSessionNotKept():
        _email.clear();
        _password.clear();
      case SignInChallengedState():
        _email.clear();
        _password.clear();
        // AF-02: the challenge continues on its own screen (UC-04), still
        // carrying any route the guard remembered (UC-07 step 7).
        context.go(
          Routes.carrying(
            Routes.challenge,
            Routes.rememberedIn(GoRouterState.of(context).uri),
          ),
        );
      // AF-01: the password goes; the email stays, to correct or retry.
      case SignInFailed(credentialsRejected: true):
        _password.clear();
      case SignInIdle() || SignInSubmitting() || SignInFailed():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    ref.listen(signInControllerProvider, _onStateChanged);
    final state = ref.watch(signInControllerProvider);
    final submitting = state is SignInSubmitting;
    final decisionPending = state is SignInSessionNotKept;
    final editable = !submitting && !decisionPending;
    final notices = ref.watch(sessionNoticeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.signInTitle)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: AutofillGroup(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final notice in notices) ...[
                    _SessionNoticeCard(
                      notice: notice,
                      onDismiss: () => ref
                          .read(sessionNoticeProvider.notifier)
                          .dismiss(notice),
                    ),
                    const SizedBox(height: 16),
                  ],
                  if (notices.isNotEmpty) const SizedBox(height: 8),
                  TextField(
                    key: SignInScreen.emailField,
                    controller: _email,
                    enabled: editable,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    textInputAction: TextInputAction.next,
                    autocorrect: false,
                    enableSuggestions: false,
                    decoration: InputDecoration(
                      labelText: l10n.signInEmailLabel,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    key: SignInScreen.passwordField,
                    controller: _password,
                    enabled: editable,
                    obscureText: true,
                    autofillHints: const [AutofillHints.password],
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    enableSuggestions: false,
                    onSubmitted: (_) => _submit(),
                    decoration: InputDecoration(
                      labelText: l10n.signInPasswordLabel,
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (submitting)
                    const Center(
                      child: CircularProgressIndicator(
                        key: SignInScreen.progress,
                      ),
                    )
                  else
                    FilledButton(
                      key: SignInScreen.submitButton,
                      onPressed: editable && _canSubmit ? _submit : null,
                      child: Text(l10n.signInSubmit),
                    ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.signInVaultStaysLocked,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                  if (state case SignInFailed() && final failed) ...[
                    const SizedBox(height: 24),
                    _FailureNotice(
                      failed: failed,
                      onRetry: _canSubmit ? _submit : null,
                    ),
                  ],
                  // AF-05: secure storage is unavailable; the user decides
                  // whether to continue with the session held for this run.
                  if (decisionPending) ...[
                    const SizedBox(height: 24),
                    SessionNotKeptNotice(
                      continueKey: SignInScreen.continueButton,
                      discardKey: SignInScreen.discardButton,
                      onContinue: ref
                          .read(signInControllerProvider.notifier)
                          .continueForThisRun,
                      onDiscard: ref
                          .read(signInControllerProvider.notifier)
                          .discardUnkeptSession,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// A refusal or a lost connection, in the API's words wherever it gave any.
class _FailureNotice extends StatelessWidget {
  const _FailureNotice({required this.failed, required this.onRetry});

  final SignInFailed failed;
  final VoidCallback? onRetry;

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
              // AF-03: shown as a lost connection, with a retry.
              if (failed.isConnectionLost) ...[
                Text(
                  l10n.signInConnectionLostTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colors.onErrorContainer,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              // AF-01 and AF-04: the API's own reason, and nothing more.
              SelectableText(
                failed.failure.message,
                key: SignInScreen.failureMessage,
                style: TextStyle(color: colors.onErrorContainer),
              ),
              if (failed.isConnectionLost) ...[
                const SizedBox(height: 12),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    key: SignInScreen.retryButton,
                    onPressed: onRetry,
                    child: Text(l10n.signInRetry),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Says one thing about how the last session ended.
class _SessionNoticeCard extends StatelessWidget {
  const _SessionNoticeCard({required this.notice, required this.onDismiss});

  final SessionNotice notice;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;
    final message = switch (notice) {
      SessionNotice.sessionEnded => l10n.signInSessionEnded,
      SessionNotice.tokenNotDeleted => l10n.signInTokenNotDeleted,
      SessionNotice.vaultNotRemoved => l10n.signInVaultNotRemoved,
    };

    return Semantics(
      liveRegion: true,
      child: Card(
        key: SignInScreen.noticeFor(notice),
        color: colors.secondaryContainer,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(color: colors.onSecondaryContainer),
                ),
              ),
              TextButton(
                key: SignInScreen.dismissFor(notice),
                onPressed: onDismiss,
                child: Text(l10n.signInDismissNotice),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
