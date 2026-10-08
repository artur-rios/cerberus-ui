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
import '../../../support/recording_stores.dart';
import '../../../support/stub_http_adapter.dart';

const _email = 'owner@example.com';
const _password = 'PASSWORD-MARKER';

/// Pumps the application at sign-in, its API answering through [adapter].
Future<ProviderContainer> _pump(
  WidgetTester tester, {
  StubHttpAdapter? adapter,
  SessionRepository? repository,
  SecureStore? secureStore,
}) => pumpCerberusApp(
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

Future<void> _fillAndSubmit(WidgetTester tester) async {
  await tester.enterText(find.byKey(SignInScreen.emailField), _email);
  await tester.enterText(find.byKey(SignInScreen.passwordField), _password);
  await tester.pump();
  await tester.tap(find.byKey(SignInScreen.submitButton));
  await tester.pumpAndSettle();
}

String _location(ProviderContainer container) => container
    .read(routerProvider)
    .routerDelegate
    .currentConfiguration
    .uri
    .toString();

String _fieldText(WidgetTester tester, Key key) =>
    tester.widget<TextField>(find.byKey(key)).controller!.text;

void main() {
  group('SignInScreen', () {
    testWidgets('Given an instance and no session '
        'When the application starts '
        'Then the sign-in form is shown, with the password concealed and '
        'nothing to submit yet', (tester) async {
      await _pump(tester);

      expect(find.byType(SignInScreen), findsOneWidget);
      expect(
        tester
            .widget<TextField>(find.byKey(SignInScreen.passwordField))
            .obscureText,
        isTrue,
      );
      expect(
        tester
            .widget<FilledButton>(find.byKey(SignInScreen.submitButton))
            .onPressed,
        isNull,
      );
    });

    testWidgets('Given credentials on their way '
        'When the API has not answered '
        'Then the screen shows it is loading and cannot be submitted again', (
      tester,
    ) async {
      final repository = FakeSessionRepository()..pending = Completer();
      await _pump(tester, repository: repository);

      await tester.enterText(find.byKey(SignInScreen.emailField), _email);
      await tester.enterText(find.byKey(SignInScreen.passwordField), _password);
      await tester.pump();
      await tester.tap(find.byKey(SignInScreen.submitButton));
      await tester.pump();

      expect(find.byKey(SignInScreen.progress), findsOneWidget);
      expect(find.byKey(SignInScreen.submitButton), findsNothing);
      expect(
        tester.widget<TextField>(find.byKey(SignInScreen.emailField)).enabled,
        isFalse,
      );

      repository.pending!.complete(
        const Failure(message: 'm', kind: FailureKind.serverError),
      );
      await tester.pumpAndSettle();
    });

    testWidgets('Given credentials the API accepts '
        'When they are submitted '
        'Then the fields are cleared and the guard routes onward — with the '
        'protocol gate closed, to the statement that the vault is not '
        'available yet (UC-03 main flow, steps 6–7)', (tester) async {
      final leaks = LeakRecorder();
      leaks.adapter.on('POST', loginPath, loginCompleted(accountId: 'acct-1'));
      final container = await _pump(
        tester,
        adapter: leaks.adapter,
        secureStore: leaks.secureStore,
      );

      await tester.enterText(find.byKey(SignInScreen.emailField), _email);
      await tester.enterText(find.byKey(SignInScreen.passwordField), _password);
      await tester.pump();
      final fields = [
        tester.widget<TextField>(find.byKey(SignInScreen.emailField)),
        tester.widget<TextField>(find.byKey(SignInScreen.passwordField)),
      ];
      await tester.tap(find.byKey(SignInScreen.submitButton));
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
      expect(fields.map((field) => field.controller!.text), ['', '']);
      leaks.expectOnlyIn(_password, {LeakChannel.request});
    });

    testWidgets('Given credentials the API rejects '
        'When they are submitted '
        'Then the API\'s generic message is shown, the password cleared and '
        'the email kept (UC-03 AF-01, FR-SE-05)', (tester) async {
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginRefused(401, 'authentication_required'));
      final container = await _pump(tester, adapter: adapter);

      await _fillAndSubmit(tester);

      expect(find.text('authentication_required'), findsOneWidget);
      expect(_fieldText(tester, SignInScreen.passwordField), isEmpty);
      expect(_fieldText(tester, SignInScreen.emailField), _email);
      expect(find.byKey(SignInScreen.retryButton), findsNothing);
      expect(container.read(sessionProvider), const SignedOut());
      expect(_location(container), Routes.signIn);
    });

    testWidgets('Given an authentication_required refusal '
        'When it is shown '
        'Then nothing about a pending closure is inferred: no cancellation is '
        'offered and nothing navigates (UC-03 AF-04, System Requirements '
        '§5.4)', (tester) async {
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginRefused(401, 'authentication_required'));
      final container = await _pump(tester, adapter: adapter);

      await _fillAndSubmit(tester);

      expect(find.text('authentication_required'), findsOneWidget);
      expect(
        find.textContaining(RegExp('clos', caseSensitive: false)),
        findsNothing,
      );
      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.byType(TextButton), findsNothing);
      expect(_location(container), Routes.signIn);
      expect(_location(container), isNot(contains(Routes.closureCancel)));
    });

    for (final (status, error) in [
      (403, 'authentication_forbidden'),
      (503, 'identity_unavailable'),
    ]) {
      testWidgets('Given the API refuses with $status $error '
          'When the credentials are submitted '
          'Then exactly the API\'s reason is shown and nothing more is offered '
          '(UC-03 AF-04, FR-DA-06)', (tester) async {
        final adapter = StubHttpAdapter()
          ..on('POST', loginPath, loginRefused(status, error));
        final container = await _pump(tester, adapter: adapter);

        await _fillAndSubmit(tester);

        expect(
          tester
              .widget<SelectableText>(find.byKey(SignInScreen.failureMessage))
              .data,
          error,
        );
        expect(find.byType(TextButton), findsNothing);
        expect(_fieldText(tester, SignInScreen.passwordField), _password);
        expect(_location(container), Routes.signIn);
        expect(container.read(sessionProvider), const SignedOut());
      });
    }

    testWidgets('Given an unreachable instance '
        'When the credentials are submitted '
        'Then a lost connection is shown with a retry, the fields are kept and '
        'no session is assumed (UC-03 AF-03)', (tester) async {
      final adapter = StubHttpAdapter();
      final container = await _pump(tester, adapter: adapter);

      await _fillAndSubmit(tester);

      expect(find.text('Connection lost'), findsOneWidget);
      expect(find.byKey(SignInScreen.retryButton), findsOneWidget);
      expect(_fieldText(tester, SignInScreen.emailField), _email);
      expect(_fieldText(tester, SignInScreen.passwordField), _password);
      expect(container.read(sessionProvider), const SignedOut());
    });

    testWidgets('Given a lost connection '
        'When the retry is tapped and the API answers '
        'Then the session is established (UC-03 AF-03)', (tester) async {
      final adapter = StubHttpAdapter();
      final container = await _pump(tester, adapter: adapter);
      await _fillAndSubmit(tester);
      adapter.on('POST', loginPath, loginCompleted(accountId: 'acct-1'));

      await tester.tap(find.byKey(SignInScreen.retryButton));
      await tester.pumpAndSettle();

      expect(adapter.requests, hasLength(2));
      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
    });

    testWidgets('Given a sign-in the API challenges '
        'When the credentials are submitted '
        'Then the challenge screen follows, the fields are cleared and no '
        'token is stored (UC-03 AF-02)', (tester) async {
      final secure = RecordingSecureStore();
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginChallenged());
      final container = await _pump(
        tester,
        adapter: adapter,
        secureStore: secure,
      );

      await _fillAndSubmit(tester);

      expect(_location(container), Routes.challenge);
      expect(find.byType(ChallengeScreen), findsOneWidget);
      expect(container.read(sessionProvider), isA<ChallengePending>());
      expect(secure.writes, isEmpty);
    });

    testWidgets('Given sign-in remembering a route the guard refused '
        'When the API answers with a second-factor challenge '
        'Then the challenge carries the remembered route on (UC-07 step 7)', (
      tester,
    ) async {
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginChallenged());
      final container = await _pump(tester, adapter: adapter);
      container.read(routerProvider).go(Routes.settings);
      await tester.pumpAndSettle();

      await _fillAndSubmit(tester);

      expect(
        _location(container),
        Routes.carrying(Routes.challenge, Routes.settings),
      );
      expect(find.byType(ChallengeScreen), findsOneWidget);
    });

    testWidgets('Given secure storage is unavailable '
        'When the API completes the login '
        'Then the screen says the session cannot be kept and asks, signing '
        'nobody in yet (UC-03 AF-05)', (tester) async {
      final leaks = LeakRecorder();
      leaks.secureStore.failure = const SecureStoreUnavailableException('x');
      leaks.adapter.on(
        'POST',
        loginPath,
        loginCompleted(token: 'TOKEN-MARKER'),
      );
      final container = await _pump(
        tester,
        adapter: leaks.adapter,
        secureStore: leaks.secureStore,
      );

      await _fillAndSubmit(tester);

      expect(find.text("This session can't be kept"), findsOneWidget);
      expect(find.byKey(SignInScreen.continueButton), findsOneWidget);
      expect(find.byKey(SignInScreen.discardButton), findsOneWidget);
      expect(container.read(sessionProvider), const SignedOut());
      expect(_fieldText(tester, SignInScreen.passwordField), isEmpty);
      leaks.expectNoLeak('TOKEN-MARKER');
    });

    testWidgets('Given a session that cannot be kept '
        'When the user continues for now '
        'Then the session exists for this run and the guard routes onward, '
        'with the token written nowhere (UC-03 AF-05)', (tester) async {
      final leaks = LeakRecorder();
      leaks.secureStore.failure = const SecureStoreUnavailableException('x');
      leaks.adapter.on(
        'POST',
        loginPath,
        loginCompleted(token: 'TOKEN-MARKER', accountId: 'acct-1'),
      );
      final container = await _pump(
        tester,
        adapter: leaks.adapter,
        secureStore: leaks.secureStore,
      );
      await _fillAndSubmit(tester);

      await tester.ensureVisible(find.byKey(SignInScreen.continueButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(SignInScreen.continueButton));
      await tester.pumpAndSettle();

      expect(
        container.read(sessionProvider),
        const SignedIn(accountId: 'acct-1'),
      );
      expect(find.byType(NotAvailableScreen), findsOneWidget);
      leaks.expectNoLeak('TOKEN-MARKER');
    });

    testWidgets('Given a session that cannot be kept '
        'When the user cancels '
        'Then nobody is signed in and the form is ready again (UC-03 AF-05)', (
      tester,
    ) async {
      final secure = RecordingSecureStore()
        ..failure = const SecureStoreUnavailableException('x');
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginCompleted());
      final container = await _pump(
        tester,
        adapter: adapter,
        secureStore: secure,
      );
      await _fillAndSubmit(tester);

      await tester.ensureVisible(find.byKey(SignInScreen.discardButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(SignInScreen.discardButton));
      await tester.pumpAndSettle();

      expect(container.read(sessionProvider), const SignedOut());
      expect(find.byKey(SignInScreen.continueButton), findsNothing);
      expect(_location(container), Routes.signIn);
    });

    group('when the stored session was rejected at start (UC-05 AF-02)', () {
      Future<(ProviderContainer, RecordingSecureStore)> start(
        WidgetTester tester,
        FakeSessionRepository repository,
      ) async {
        final secureStore = RecordingSecureStore()
          ..values[SecureKey.sessionToken] = 'stored-token';
        final container = await pumpCerberusApp(
          tester,
          secureStore: secureStore,
          restoreSession: true,
          overrides: [sessionRepositoryProvider.overrideWithValue(repository)],
        );
        return (container, secureStore);
      }

      FakeSessionRepository rejecting() => FakeSessionRepository()
        ..nextVerification = const Failure(
          message: 'authentication_required',
          kind: FailureKind.unauthenticated,
        );

      testWidgets('Given a stored token the API rejects '
          'When the application starts '
          'Then sign-in says the session ended, and the token is gone', (
        tester,
      ) async {
        final (container, secureStore) = await start(tester, rejecting());

        expect(_location(container), Routes.signIn);
        expect(find.byKey(SignInScreen.sessionEndedNotice), findsOneWidget);
        expect(
          find.text('Your session ended. Sign in again to continue.'),
          findsOneWidget,
        );
        expect(secureStore.values, isNot(contains(SecureKey.sessionToken)));
      });

      testWidgets('Given the session-ended notice '
          'When it is dismissed '
          'Then it is gone', (tester) async {
        await start(tester, rejecting());

        await tester.tap(find.byKey(SignInScreen.dismissNoticeButton));
        await tester.pumpAndSettle();

        expect(find.byKey(SignInScreen.sessionEndedNotice), findsNothing);
      });

      testWidgets('Given the session-ended notice '
          'When the user signs in again '
          'Then it is gone', (tester) async {
        final repository = rejecting()
          ..next = const Success(
            SignInCompleted(token: 'token', accountId: 'acct-1'),
          );
        await start(tester, repository);

        await _fillAndSubmit(tester);

        expect(find.byKey(SignInScreen.sessionEndedNotice), findsNothing);
      });

      testWidgets('Given no stored session '
          'When the application starts '
          'Then sign-in shows no notice (UC-05 AF-01)', (tester) async {
        final container = await pumpCerberusApp(
          tester,
          restoreSession: true,
          overrides: [
            sessionRepositoryProvider.overrideWithValue(
              FakeSessionRepository(),
            ),
          ],
        );

        expect(_location(container), Routes.signIn);
        expect(find.byKey(SignInScreen.sessionEndedNotice), findsNothing);
      });
    });
  });
}
