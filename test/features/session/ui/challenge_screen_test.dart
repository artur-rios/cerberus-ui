import 'dart:async';

import 'package:cerberus_ui/app/router.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/network/http_client.dart';
import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/data/api_session_repository.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';
import 'package:cerberus_ui/features/session/ui/challenge_screen.dart';
import 'package:cerberus_ui/features/session/ui/sign_in_screen.dart';
import 'package:cerberus_ui/shared/widgets/not_available_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../support/auth_payloads.dart';
import '../../../support/fake_session_repository.dart';
import '../../../support/leak_recorder.dart';
import '../../../support/pump_app.dart';
import '../../../support/stub_http_adapter.dart';

const _challengeToken = 'CHALLENGE-MARKER';
const _code = 'CODE-MARKER';

/// Pumps the application holding an outstanding challenge, at the challenge
/// screen, its API answering through [adapter].
Future<ProviderContainer> _pump(
  WidgetTester tester, {
  StubHttpAdapter? adapter,
  SessionRepository? repository,
  SecureStore? secureStore,
  List<String> methods = const ['App'],
}) async {
  final container = await pumpCerberusApp(
    tester,
    secureStore: secureStore,
    overrides: [
      sessionRepositoryProvider.overrideWithValue(
        repository ??
            ApiSessionRepository.over(
              createHttpClient(
                baseUrl: Uri.parse('https://vault.example'),
                readToken: () async => null,
                adapter: adapter ?? StubHttpAdapter(),
              ),
            ),
      ),
    ],
  );
  container
      .read(sessionProvider.notifier)
      .challenge(challengeToken: _challengeToken, methods: methods);
  container.read(routerProvider).go(Routes.challenge);
  await tester.pumpAndSettle();
  return container;
}

Future<void> _enterAndSubmit(WidgetTester tester, [String code = _code]) async {
  await tester.enterText(find.byKey(ChallengeScreen.codeField), code);
  await tester.pump();
  await tester.tap(find.byKey(ChallengeScreen.submitButton));
  await tester.pumpAndSettle();
}

Future<void> _tapVisible(WidgetTester tester, Key key) async {
  await tester.ensureVisible(find.byKey(key));
  await tester.pumpAndSettle();
  await tester.tap(find.byKey(key));
  await tester.pumpAndSettle();
}

String _location(ProviderContainer container) => container
    .read(routerProvider)
    .routerDelegate
    .currentConfiguration
    .uri
    .toString();

String _codeText(WidgetTester tester) => tester
    .widget<TextField>(find.byKey(ChallengeScreen.codeField))
    .controller!
    .text;

void main() {
  group('ChallengeScreen', () {
    testWidgets('Given a challenge offering the authenticator app and email '
        'When the screen opens '
        'Then it names each method, and there is nothing to submit yet '
        '(UC-04 step 1)', (tester) async {
      await _pump(tester, methods: const ['App', 'Email']);

      expect(find.byType(ChallengeScreen), findsOneWidget);
      expect(find.byKey(ChallengeScreen.methodKey('App')), findsOneWidget);
      expect(find.text('Your authenticator app'), findsOneWidget);
      expect(find.byKey(ChallengeScreen.methodKey('Email')), findsOneWidget);
      expect(find.text('A code sent to your email'), findsOneWidget);
      expect(
        tester
            .widget<FilledButton>(find.byKey(ChallengeScreen.submitButton))
            .onPressed,
        isNull,
      );
    });

    testWidgets('Given a method the application does not know '
        'When the screen opens '
        'Then it is named as the API named it, rather than hidden', (
      tester,
    ) async {
      await _pump(tester, methods: const ['Passkey']);

      expect(find.text('Passkey'), findsOneWidget);
    });

    testWidgets('Given a code on its way '
        'When the API has not answered '
        'Then the screen shows it is loading and cannot be submitted again', (
      tester,
    ) async {
      final repository = FakeSessionRepository()
        ..pendingChallenge = Completer();
      await _pump(tester, repository: repository);

      await tester.enterText(find.byKey(ChallengeScreen.codeField), _code);
      await tester.pump();
      await tester.tap(find.byKey(ChallengeScreen.submitButton));
      await tester.pump();

      expect(find.byKey(ChallengeScreen.progress), findsOneWidget);
      expect(find.byKey(ChallengeScreen.submitButton), findsNothing);
      expect(
        tester.widget<TextField>(find.byKey(ChallengeScreen.codeField)).enabled,
        isFalse,
      );

      repository.pendingChallenge!.complete(
        const Failure(message: 'm', kind: FailureKind.serverError),
      );
      await tester.pumpAndSettle();
    });

    testWidgets('Given a code the API accepts '
        'When it is submitted '
        'Then the code is cleared, a session exists and the guard routes '
        'onward — with the protocol gate closed, to the statement that the '
        'vault is not available yet (UC-04 main flow, steps 5–7)', (
      tester,
    ) async {
      final leaks = LeakRecorder();
      leaks.adapter.on(
        'POST',
        challengePath,
        challengeCompleted(accountId: 'acct-1'),
      );
      final container = await _pump(
        tester,
        adapter: leaks.adapter,
        secureStore: leaks.secureStore,
      );
      await tester.enterText(find.byKey(ChallengeScreen.codeField), _code);
      await tester.pump();
      final field = tester.widget<TextField>(
        find.byKey(ChallengeScreen.codeField),
      );

      await tester.tap(find.byKey(ChallengeScreen.submitButton));
      await tester.pumpAndSettle();

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
      expect(
        _location(container),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      expect(find.byType(NotAvailableScreen), findsOneWidget);
      expect(field.controller!.text, isEmpty);
      leaks.expectOnlyIn(_code, {LeakChannel.request});
      leaks.expectOnlyIn(_challengeToken, {LeakChannel.request});
    });

    testWidgets('Given a code the API refuses with authentication_required '
        'When it is submitted '
        'Then the API\'s message is shown, the code cleared, the challenge kept '
        'for another attempt, and signing in again is offered — nothing is '
        'inferred about expiry (UC-04 AF-01, AF-02)', (tester) async {
      final adapter = StubHttpAdapter()
        ..on('POST', challengePath, challengeRefused());
      final container = await _pump(tester, adapter: adapter);

      await _enterAndSubmit(tester);

      expect(find.text('authentication_required'), findsOneWidget);
      expect(_codeText(tester), isEmpty);
      expect(
        container.read(sessionProvider),
        const ChallengePending(
          challengeToken: _challengeToken,
          methods: ['App'],
        ),
      );
      expect(_location(container), Routes.challenge);
      expect(find.byKey(ChallengeScreen.repeatSignInButton), findsOneWidget);
      expect(find.byKey(ChallengeScreen.retryButton), findsNothing);
      expect(
        tester
            .widget<EditableText>(
              find.descendant(
                of: find.byKey(ChallengeScreen.codeField),
                matching: find.byType(EditableText),
              ),
            )
            .focusNode
            .hasFocus,
        isTrue,
        reason: 'the cleared field is ready for another code',
      );
      expect(
        find.textContaining(RegExp('expir', caseSensitive: false)),
        findsNothing,
      );
    });

    testWidgets('Given a refused code '
        'When another code is entered '
        'Then it is submitted with the same challenge (UC-04 AF-01)', (
      tester,
    ) async {
      final adapter = StubHttpAdapter()
        ..on('POST', challengePath, challengeRefused());
      final container = await _pump(tester, adapter: adapter);
      await _enterAndSubmit(tester);
      adapter.on(
        'POST',
        challengePath,
        challengeCompleted(accountId: 'acct-1'),
      );

      await _enterAndSubmit(tester, 'SECOND-CODE');

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
      expect(adapter.requests, hasLength(2));
      expect(adapter.requests.last.body, contains(_challengeToken));
    });

    testWidgets('Given a refused code — wrong, or for an expired challenge '
        'When the user chooses to sign in again '
        'Then the challenge is discarded and the sign-in screen follows '
        '(UC-04 AF-01, AF-02)', (tester) async {
      final adapter = StubHttpAdapter()
        ..on('POST', challengePath, challengeRefused());
      final container = await _pump(tester, adapter: adapter);
      await _enterAndSubmit(tester);

      await _tapVisible(tester, ChallengeScreen.repeatSignInButton);

      expect(container.read(sessionProvider), const SignedOut());
      expect(_location(container), Routes.signIn);
      expect(find.byType(SignInScreen), findsOneWidget);
    });

    testWidgets('Given an outstanding challenge '
        'When the user goes back '
        'Then the challenge is discarded and the sign-in screen follows '
        '(UC-04 AF-03)', (tester) async {
      final container = await _pump(tester);

      await tester.tap(find.byKey(ChallengeScreen.backButton));
      await tester.pumpAndSettle();

      expect(container.read(sessionProvider), const SignedOut());
      expect(_location(container), Routes.signIn);
    });

    testWidgets('Given an outstanding challenge '
        'When the platform\'s back is used '
        'Then the challenge is discarded and the sign-in screen follows '
        '(UC-04 AF-03)', (tester) async {
      final container = await _pump(tester);

      await tester.binding.handlePopRoute();
      await tester.pumpAndSettle();

      expect(container.read(sessionProvider), const SignedOut());
      expect(_location(container), Routes.signIn);
    });

    testWidgets('Given an outstanding challenge '
        'When a guarded route is reached by typed address '
        'Then the guard treats it as signed out, and leaving the challenge '
        'screen discards the challenge (UC-04 AF-05, AF-03)', (tester) async {
      final container = await _pump(tester);

      container.read(routerProvider).go(Routes.records);
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
      expect(find.byType(SignInScreen), findsOneWidget);
      expect(container.read(sessionProvider), const SignedOut());
    });

    testWidgets('Given an unreachable instance '
        'When a code is submitted '
        'Then the connection is shown lost with a retry, the code is kept, '
        'and the retry resends it with the same challenge (UC-04 AF-04)', (
      tester,
    ) async {
      final adapter = StubHttpAdapter();
      final container = await _pump(tester, adapter: adapter);

      await _enterAndSubmit(tester);

      expect(find.text('Connection lost'), findsOneWidget);
      expect(_codeText(tester), _code);
      expect(container.read(sessionProvider), isA<ChallengePending>());
      expect(find.byKey(ChallengeScreen.repeatSignInButton), findsNothing);

      adapter.on(
        'POST',
        challengePath,
        challengeCompleted(accountId: 'acct-1'),
      );
      await _tapVisible(tester, ChallengeScreen.retryButton);

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
      expect(
        adapter.requests.map((request) => request.body),
        everyElement(allOf(contains(_challengeToken), contains(_code))),
      );
    });

    group('when secure storage is unavailable', () {
      Future<ProviderContainer> pumpUnavailable(WidgetTester tester) {
        final leaks = LeakRecorder();
        leaks.secureStore.failure = const SecureStoreUnavailableException('x');
        leaks.adapter.on(
          'POST',
          challengePath,
          challengeCompleted(accountId: 'acct-1'),
        );
        return _pump(
          tester,
          adapter: leaks.adapter,
          secureStore: leaks.secureStore,
        );
      }

      testWidgets('Given a code the API accepts '
          'When the session cannot be kept '
          'Then the user is asked whether to continue for this run, and '
          'continuing establishes the session (step 6, as UC-03 AF-05)', (
        tester,
      ) async {
        final container = await pumpUnavailable(tester);

        await _enterAndSubmit(tester);

        expect(find.text("This session can't be kept"), findsOneWidget);
        expect(container.read(sessionProvider), isA<ChallengePending>());

        await _tapVisible(tester, ChallengeScreen.continueButton);

        expect(
          container.read(sessionProvider),
          const SignedIn(accountId: 'acct-1'),
        );
      });

      testWidgets('Given a session that cannot be kept '
          'When the user declines '
          'Then nothing is kept and the sign-in screen follows', (
        tester,
      ) async {
        final container = await pumpUnavailable(tester);
        await _enterAndSubmit(tester);

        await _tapVisible(tester, ChallengeScreen.discardButton);

        expect(container.read(sessionProvider), const SignedOut());
        expect(_location(container), Routes.signIn);
      });
    });
  });
}
