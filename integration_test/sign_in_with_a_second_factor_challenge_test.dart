// The "sign in with a second-factor challenge" journey (Testing Specification
// §7.2): the real routing, providers, repositories and widgets, against a
// contract-shaped stubbed API. Only the transport is stubbed.

import 'package:cerberus_ui/app/router.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/network/http_client.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/session/session_token_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:cerberus_ui/features/session/ui/challenge_screen.dart';
import 'package:cerberus_ui/features/session/ui/sign_in_screen.dart';
import 'package:cerberus_ui/shared/widgets/not_available_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/support/auth_payloads.dart';
import '../test/support/leak_recorder.dart';
import '../test/support/pump_app.dart';

const _email = 'owner@example.com';
const _password = 'PASSWORD-MARKER';
const _wrongCode = 'WRONG-CODE-MARKER';
const _code = 'CODE-MARKER';
const _token = 'TOKEN-MARKER';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Given an account protected by a second factor '
      'When the owner signs in, mistypes the code, then enters the right one '
      'Then a session exists, the token is kept only in secure storage, and '
      'the guard routes onward (UC-03, UC-04)', (tester) async {
    final leaks = LeakRecorder();
    leaks.adapter
      ..on(
        'POST',
        loginPath,
        loginChallenged(
          challengeToken: 'CHALLENGE-MARKER',
          methods: const ['App', 'Email'],
        ),
      )
      ..on('POST', challengePath, challengeRefused());
    final container = await pumpCerberusApp(
      tester,
      secureStore: leaks.secureStore,
      overrides: [
        httpClientProvider.overrideWith(
          (ref) => createHttpClient(
            baseUrl: Uri.parse('https://vault.example'),
            readToken: ref.watch(sessionTokenStoreProvider).read,
            onUnauthenticated: () => ref.read(sessionProvider.notifier).end(),
            adapter: leaks.adapter,
          ),
        ),
      ],
    );
    final router = container.read(routerProvider);

    // Sign in (UC-03): the API challenges.
    expect(find.byType(SignInScreen), findsOneWidget);
    await tester.enterText(find.byKey(SignInScreen.emailField), _email);
    await tester.enterText(find.byKey(SignInScreen.passwordField), _password);
    await tester.pump();
    await tester.tap(find.byKey(SignInScreen.submitButton));
    await tester.pumpAndSettle();

    expect(find.byType(ChallengeScreen), findsOneWidget);
    expect(find.text('Your authenticator app'), findsOneWidget);
    expect(find.text('A code sent to your email'), findsOneWidget);
    expect(container.read(sessionProvider), isA<ChallengePending>());

    // A mistyped code is refused; the challenge stays (UC-04 AF-01).
    await tester.enterText(find.byKey(ChallengeScreen.codeField), _wrongCode);
    await tester.pump();
    await tester.tap(find.byKey(ChallengeScreen.submitButton));
    await tester.pumpAndSettle();

    expect(find.text('authentication_required'), findsOneWidget);
    expect(find.byKey(ChallengeScreen.repeatSignInButton), findsOneWidget);
    expect(container.read(sessionProvider), isA<ChallengePending>());

    // The right code completes the sign-in (UC-04 main flow).
    leaks.adapter.on(
      'POST',
      challengePath,
      challengeCompleted(token: _token, accountId: 'acct-1'),
    );
    await tester.enterText(find.byKey(ChallengeScreen.codeField), _code);
    await tester.pump();
    await tester.tap(find.byKey(ChallengeScreen.submitButton));
    await tester.pumpAndSettle();

    expect(
      container.read(sessionProvider),
      const SignedIn(accountId: 'acct-1'),
    );
    expect(
      router.routerDelegate.currentConfiguration.uri.toString(),
      Routes.unavailableFor(UnavailableReason.protocol),
    );
    expect(find.byType(NotAvailableScreen), findsOneWidget);
    expect(await leaks.secureStore.read(SecureKey.sessionToken), _token);

    // Nothing left memory but where it belongs.
    leaks.expectOnlyIn(_token, {LeakChannel.secureStorage});
    leaks.expectOnlyIn(_password, {LeakChannel.request});
    leaks.expectOnlyIn(_wrongCode, {LeakChannel.request});
    leaks.expectOnlyIn(_code, {LeakChannel.request});
    leaks.expectOnlyIn('CHALLENGE-MARKER', {LeakChannel.request});
  });
}
