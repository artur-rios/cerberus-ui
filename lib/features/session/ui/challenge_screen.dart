/// The second-factor challenge screen (UC-04, `/sign-in/challenge`).
///
/// Reachable only while the session holds a challenge (FR-SE-04). It never
/// navigates for itself: when the challenge ends — completed, or given up to
/// repeat the sign-in — the session changes and the guard takes the user
/// onward. Leaving it by any other way discards the challenge too (AF-03), so
/// no partial session outlives the screen.
library;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/session/session_controller.dart';
import '../../../core/session/session_state.dart';
import '../../../l10n/app_localizations.dart';
import '../state/challenge_controller.dart';
import 'session_not_kept_notice.dart';

/// Completes a sign-in the API challenged.
class ChallengeScreen extends ConsumerStatefulWidget {
  const ChallengeScreen({super.key});

  static const codeField = Key('challenge.code');
  static const submitButton = Key('challenge.submit');
  static const progress = Key('challenge.progress');
  static const backButton = Key('challenge.back');
  static const failureMessage = Key('challenge.failure');
  static const repeatSignInButton = Key('challenge.repeat-sign-in');
  static const retryButton = Key('challenge.retry');
  static const continueButton = Key('challenge.continue');
  static const discardButton = Key('challenge.discard');

  /// The key of the line naming [method].
  static Key methodKey(String method) => Key('challenge.method.$method');

  @override
  ConsumerState<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends ConsumerState<ChallengeScreen> {
  // Disposed with the screen, which is what clears the code when it is left.
  final _code = TextEditingController();
  final _codeFocus = FocusNode();

  // Captured while the screen is alive, because `ref` cannot be used once it
  // is being disposed — which is exactly when AF-03 needs them.
  late final SessionController _session;
  String? _challengeToken;

  @override
  void initState() {
    super.initState();
    _code.addListener(_onCodeChanged);
    _session = ref.read(sessionProvider.notifier);
    if (ref.read(sessionProvider) case ChallengePending(
      :final challengeToken,
    )) {
      _challengeToken = challengeToken;
    }
  }

  @override
  void dispose() {
    _code.dispose();
    _codeFocus.dispose();
    // AF-03 and AF-05: however the screen was left — a typed address, a link,
    // the platform's back — the challenge goes with it. A completed challenge
    // is already a session, which this leaves alone.
    final challengeToken = _challengeToken;
    if (challengeToken != null) {
      Future.microtask(() => _session.abandonChallenge(challengeToken));
    }
    super.dispose();
  }

  void _onCodeChanged() => setState(() {});

  bool get _canSubmit => _code.text.trim().isNotEmpty;

  ChallengeController get _controller =>
      ref.read(challengeControllerProvider.notifier);

  Future<void> _submit() async {
    if (!_canSubmit) return;
    await _controller.submit(_code.text.trim());
  }

  void _onStateChanged(ChallengeState? previous, ChallengeState next) {
    switch (next) {
      // Step 6: the code is cleared once the API completed the login.
      case ChallengeCompletedState() || ChallengeSessionNotKept():
        _code.clear();
      // AF-01: a refused code is worth nothing; it is cleared for another,
      // and the field takes the focus back once the rebuild re-enables it —
      // submitting disabled it, and a disabled field lets its focus go.
      case ChallengeRefused():
        _code.clear();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) _codeFocus.requestFocus();
        });
      // AF-04: nothing was refused, so the code stays for the retry.
      case ChallengeIdle() ||
          ChallengeSubmitting() ||
          ChallengeConnectionLost():
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    ref.listen(challengeControllerProvider, _onStateChanged);
    final state = ref.watch(challengeControllerProvider);
    final session = ref.watch(sessionProvider);

    // The challenge has ended and the guard is moving on. Showing the form
    // again would invite a code with nowhere to go.
    if (session is! ChallengePending) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final submitting = state is ChallengeSubmitting;
    final decisionPending = state is ChallengeSessionNotKept;
    final editable = !submitting && !decisionPending;

    return PopScope(
      canPop: false,
      // AF-03: going back is leaving, and leaving discards the challenge.
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _controller.repeatSignIn();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.challengeTitle),
          leading: BackButton(
            key: ChallengeScreen.backButton,
            onPressed: _controller.repeatSignIn,
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Step 1: the methods the API asked for, each named.
                  Text(l10n.challengeIntro, style: theme.textTheme.bodyLarge),
                  const SizedBox(height: 8),
                  for (final method in session.methods)
                    ListTile(
                      key: ChallengeScreen.methodKey(method),
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(_methodIcon(method)),
                      title: Text(_methodName(l10n, method)),
                    ),
                  const SizedBox(height: 16),
                  TextField(
                    key: ChallengeScreen.codeField,
                    controller: _code,
                    focusNode: _codeFocus,
                    enabled: editable,
                    autofocus: true,
                    keyboardType: TextInputType.visiblePassword,
                    autofillHints: const [AutofillHints.oneTimeCode],
                    textInputAction: TextInputAction.done,
                    autocorrect: false,
                    enableSuggestions: false,
                    onSubmitted: (_) => _submit(),
                    decoration: InputDecoration(
                      labelText: l10n.challengeCodeLabel,
                    ),
                  ),
                  const SizedBox(height: 24),
                  if (submitting)
                    const Center(
                      child: CircularProgressIndicator(
                        key: ChallengeScreen.progress,
                      ),
                    )
                  else
                    FilledButton(
                      key: ChallengeScreen.submitButton,
                      onPressed: editable && _canSubmit ? _submit : null,
                      child: Text(l10n.challengeSubmit),
                    ),
                  const SizedBox(height: 12),
                  Text(
                    l10n.signInVaultStaysLocked,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall,
                  ),
                  if (state case ChallengeRefused(:final failure)) ...[
                    const SizedBox(height: 24),
                    _FailureNotice(
                      message: failure.message,
                      hint: l10n.challengeRefusedHint,
                      action: TextButton(
                        key: ChallengeScreen.repeatSignInButton,
                        onPressed: _controller.repeatSignIn,
                        child: Text(l10n.challengeRepeatSignIn),
                      ),
                    ),
                  ],
                  if (state case ChallengeConnectionLost(:final failure)) ...[
                    const SizedBox(height: 24),
                    _FailureNotice(
                      title: l10n.signInConnectionLostTitle,
                      message: failure.message,
                      action: TextButton(
                        key: ChallengeScreen.retryButton,
                        onPressed: _canSubmit ? _submit : null,
                        child: Text(l10n.signInRetry),
                      ),
                    ),
                  ],
                  if (decisionPending) ...[
                    const SizedBox(height: 24),
                    SessionNotKeptNotice(
                      continueKey: ChallengeScreen.continueButton,
                      discardKey: ChallengeScreen.discardButton,
                      onContinue: _controller.continueForThisRun,
                      onDiscard: _controller.discardUnkeptSession,
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

  /// The method as the user knows it; one the application does not know is
  /// shown as the API named it, rather than hidden.
  static String _methodName(AppLocalizations l10n, String method) =>
      switch (method) {
        'App' => l10n.challengeMethodApp,
        'Email' => l10n.challengeMethodEmail,
        _ => method,
      };

  static IconData _methodIcon(String method) => switch (method) {
    'App' => Icons.phonelink_lock_outlined,
    'Email' => Icons.email_outlined,
    _ => Icons.key_outlined,
  };
}

/// A refusal or a lost connection, in the API's words wherever it gave any.
class _FailureNotice extends StatelessWidget {
  const _FailureNotice({
    required this.message,
    required this.action,
    this.title,
    this.hint,
  });

  final String? title;
  final String message;
  final String? hint;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final onError = TextStyle(color: colors.onErrorContainer);

    return Semantics(
      liveRegion: true,
      child: Card(
        color: colors.errorContainer,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title case final title?) ...[
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: colors.onErrorContainer,
                  ),
                ),
                const SizedBox(height: 8),
              ],
              SelectableText(
                message,
                key: ChallengeScreen.failureMessage,
                style: onError,
              ),
              if (hint case final hint?) ...[
                const SizedBox(height: 8),
                Text(hint, style: onError),
              ],
              const SizedBox(height: 12),
              Align(alignment: AlignmentDirectional.centerEnd, child: action),
            ],
          ),
        ),
      ),
    );
  }
}
