import 'package:cerberus_ui/app/router.dart';
import 'package:cerberus_ui/app/routes.dart';
import 'package:cerberus_ui/core/network/api_failure.dart';
import 'package:cerberus_ui/core/network/http_client.dart';
import 'package:cerberus_ui/core/result/result.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_notice.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/session/vault_state.dart';
import 'package:cerberus_ui/features/session/data/api_session_repository.dart';
import 'package:cerberus_ui/features/session/data/session_repository.dart';
import 'package:cerberus_ui/features/session/ui/challenge_screen.dart';
import 'package:cerberus_ui/features/session/ui/sign_in_screen.dart';
import 'package:cerberus_ui/shared/widgets/not_available_screen.dart';
import 'package:cerberus_ui/shared/widgets/not_found_screen.dart';
import 'package:cerberus_ui/shared/widgets/pending_feature_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../support/auth_payloads.dart';
import '../support/pump_app.dart';
import '../support/stub_http_adapter.dart';

String _location(ProviderContainer container) => container
    .read(routerProvider)
    .routerDelegate
    .currentConfiguration
    .uri
    .toString();

/// A vault state claiming an unlocked profile that nothing unlocked — client
/// state manipulated to reveal what the guard hides (UC-07 AF-04).
class _ForgedUnlockedVault extends VaultStateController {
  @override
  VaultState build() => const VaultUnlocked(profileId: 'profile-1');
}

/// Pumps the application with sign-in and the challenge answered by [adapter].
Future<ProviderContainer> _pumpSigningInThrough(
  WidgetTester tester,
  StubHttpAdapter adapter,
) => pumpCerberusApp(
  tester,
  overrides: [
    sessionRepositoryProvider.overrideWithValue(
      ApiSessionRepository.over(
        createHttpClient(
          baseUrl: Uri.parse('https://vault.example'),
          readToken: () async => null,
          adapter: adapter,
        ),
      ),
    ),
  ],
);

Future<void> _signIn(WidgetTester tester) async {
  await tester.enterText(find.byKey(SignInScreen.emailField), 'o@example.com');
  await tester.enterText(find.byKey(SignInScreen.passwordField), 'secret');
  await tester.pump();
  await tester.tap(find.byKey(SignInScreen.submitButton));
  await tester.pumpAndSettle();
}

void main() {
  group('routerProvider — remembered routes (UC-07 steps 1, 5 and 7)', () {
    testWidgets('Given no session '
        'When a deep link is followed and the user signs in through a '
        'second-factor challenge '
        'Then sign-in remembers the link, the challenge carries it, and the '
        'session opens it through the guard', (tester) async {
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginChallenged())
        ..on('POST', challengePath, challengeCompleted());
      final container = await _pumpSigningInThrough(tester, adapter);

      container.read(routerProvider).go(Routes.settings);
      await tester.pumpAndSettle();
      expect(
        _location(container),
        Routes.carrying(Routes.signIn, Routes.settings),
      );

      await _signIn(tester);
      expect(
        _location(container),
        Routes.carrying(Routes.challenge, Routes.settings),
      );

      await tester.enterText(find.byKey(ChallengeScreen.codeField), '123456');
      await tester.pump();
      await tester.tap(find.byKey(ChallengeScreen.submitButton));
      await tester.pumpAndSettle();

      expect(container.read(sessionProvider), isA<SignedIn>());
      expect(_location(container), Routes.settings);
    });

    testWidgets('Given no session '
        'When a deep link to the vault is followed and the user signs in '
        'Then the remembered route passes the guard again, which states why '
        'the vault is not available (AF-06)', (tester) async {
      final adapter = StubHttpAdapter()
        ..on('POST', loginPath, loginCompleted());
      final container = await _pumpSigningInThrough(tester, adapter);

      container.read(routerProvider).go('/records/r-1');
      await tester.pumpAndSettle();
      await _signIn(tester);

      expect(
        _location(container),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      expect(find.byType(NotAvailableScreen), findsOneWidget);
    });
  });

  group('routerProvider — what the API refuses (UC-07 AF-01, AF-04)', () {
    testWidgets('Given a session on a route '
        'When a request\'s token is rejected mid-session '
        'Then the session ends, the vault locks, the user is sent to sign-in '
        'remembering the route, and the request is neither replayed nor '
        'queued (AF-01)', (tester) async {
      final container = await pumpCerberusApp(tester);
      await container
          .read(sessionProvider.notifier)
          .establish(token: 't', accountId: 'acct-1');
      container
          .read(vaultStateProvider.notifier)
          .recordProtection(exists: true);
      container.read(routerProvider).go(Routes.settings);
      await tester.pumpAndSettle();

      final adapter = StubHttpAdapter()
        ..on('GET', '/api/thing', loginRefused(401, tokenRejectedCode));
      final dio = container.read(httpClientProvider)
        ..httpClientAdapter = adapter;
      // Real transport futures, outside the widget test's fake clock.
      await tester.runAsync(
        () => expectLater(
          dio.get<Object?>('/api/thing'),
          throwsA(isA<DioException>()),
        ),
      );
      await tester.pumpAndSettle();

      expect(container.read(sessionProvider), const SignedOut());
      expect(container.read(vaultStateProvider), const VaultLocked());
      expect(container.read(sessionNoticeProvider), {
        SessionNotice.sessionEnded,
      });
      expect(
        _location(container),
        Routes.carrying(Routes.signIn, Routes.settings),
      );
      expect(adapter.requests, hasLength(1));
    });

    testWidgets('Given client state manipulated to claim an unlocked vault '
        'When a hidden vault route is opened and a hidden action attempted '
        'Then the guard still refuses the route, and the API\'s refusal of '
        'the action is honored and kept as the API stated it (AF-04, '
        'FR-DA-10)', (tester) async {
      final container = await pumpCerberusApp(
        tester,
        overrides: [vaultStateProvider.overrideWith(_ForgedUnlockedVault.new)],
      );
      await container
          .read(sessionProvider.notifier)
          .establish(token: 't', accountId: 'acct-1');
      await tester.pumpAndSettle();

      container.read(routerProvider).go('/records/r-1');
      await tester.pumpAndSettle();
      expect(
        _location(container),
        Routes.unavailableFor(UnavailableReason.protocol),
      );

      final refusal = loginRefused(403, 'vault_access_denied');
      final adapter = StubHttpAdapter()
        ..on('POST', '/api/vault/unlock', refusal)
        ..on('DELETE', '/api/trash', loginRefused(401, tokenRejectedCode));
      final dio = container.read(httpClientProvider)
        ..httpClientAdapter = adapter;

      // Real transport futures, outside the widget test's fake clock.
      final forbidden = await tester.runAsync(
        () => dio
            .post<Object?>('/api/vault/unlock', data: const {})
            .then<Failure<void>?>((_) => null)
            .catchError(
              (Object e) => failureFromDioException<void>(e as DioException),
            ),
      );
      await tester.pumpAndSettle();

      expect(forbidden?.kind, FailureKind.forbidden);
      expect(forbidden?.message, messageFromResponse(refusal.json));
      expect(container.read(sessionProvider), isA<SignedIn>());

      await tester.runAsync(
        () => expectLater(
          dio.delete<Object?>('/api/trash'),
          throwsA(isA<DioException>()),
        ),
      );
      await tester.pumpAndSettle();

      expect(container.read(sessionProvider), const SignedOut());
      expect(_location(container), Routes.signIn);
    });
  });

  group('routerProvider', () {
    testWidgets('Given no instance '
        'When the application starts '
        'Then the guard sends it to setup', (tester) async {
      final container = await pumpCerberusApp(tester, instance: '');

      expect(_location(container), Routes.setup);
      expect(find.byType(PendingFeatureScreen), findsOneWidget);
    });

    testWidgets('Given an instance and no session '
        'When the application starts '
        'Then the guard sends it to sign-in', (tester) async {
      final container = await pumpCerberusApp(tester);

      expect(_location(container), Routes.signIn);
      expect(find.byType(SignInScreen), findsOneWidget);
    });

    testWidgets('Given an outstanding second-factor challenge '
        'When the challenge route is requested '
        'Then it is admitted and shows the challenge (UC-04)', (tester) async {
      final container = await pumpCerberusApp(tester);
      container
          .read(sessionProvider.notifier)
          .challenge(challengeToken: 'c', methods: ['App']);

      container.read(routerProvider).go(Routes.challenge);
      await tester.pumpAndSettle();

      expect(_location(container), Routes.challenge);
      expect(find.byType(ChallengeScreen), findsOneWidget);
    });

    testWidgets('Given no challenge '
        'When the challenge route is requested '
        'Then the guard sends the visitor to sign-in', (tester) async {
      final container = await pumpCerberusApp(tester);

      container.read(routerProvider).go(Routes.challenge);
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
    });

    testWidgets('Given a session and the closed protocol gate '
        'When the session is established '
        'Then the guard re-evaluates at once and states why the vault is not '
        'available', (tester) async {
      final container = await pumpCerberusApp(tester);

      await container
          .read(sessionProvider.notifier)
          .establish(token: 't', accountId: 'acct-1');
      await tester.pumpAndSettle();

      expect(
        _location(container),
        Routes.unavailableFor(UnavailableReason.protocol),
      );
      expect(find.byType(NotAvailableScreen), findsOneWidget);
    });

    testWidgets('Given a session '
        'When it ends mid-screen '
        'Then the guard sends the user to sign-in without waiting for '
        'navigation', (tester) async {
      final container = await pumpCerberusApp(tester);
      await container
          .read(sessionProvider.notifier)
          .establish(token: 't', accountId: 'acct-1');
      await tester.pumpAndSettle();

      await container.read(sessionProvider.notifier).end();
      await tester.pumpAndSettle();

      expect(_location(container), Routes.signIn);
    });

    testWidgets('Given a session '
        'When an address no route names is requested '
        'Then the not-found screen is shown, after the guard', (tester) async {
      final container = await pumpCerberusApp(tester);
      await container
          .read(sessionProvider.notifier)
          .establish(token: 't', accountId: 'acct-1');
      await tester.pumpAndSettle();

      container.read(routerProvider).go('/no/such/route');
      await tester.pumpAndSettle();

      expect(find.byType(NotFoundScreen), findsOneWidget);
    });
  });
}
