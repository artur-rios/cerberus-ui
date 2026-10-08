import 'package:cerberus_ui/core/config/app_config.dart';
import 'package:cerberus_ui/core/network/http_client.dart';
import 'package:cerberus_ui/core/session/session_controller.dart';
import 'package:cerberus_ui/core/session/session_notice.dart';
import 'package:cerberus_ui/core/session/session_state.dart';
import 'package:cerberus_ui/core/storage/preferences_store.dart';
import 'package:cerberus_ui/core/storage/secure_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/leak_recorder.dart';
import '../../support/recording_stores.dart';
import '../../support/stub_http_adapter.dart';

void main() {
  group('createHttpClient', () {
    test('Given the application client '
        'When its configuration is read '
        'Then it carries the base address, the timeouts and JSON', () {
      final dio = createHttpClient(
        baseUrl: Uri.parse('https://vault.example'),
        readToken: () async => null,
      );

      expect(dio.options.baseUrl, 'https://vault.example');
      expect(dio.options.connectTimeout, connectTimeout);
      expect(dio.options.sendTimeout, sendTimeout);
      expect(dio.options.receiveTimeout, receiveTimeout);
      expect(dio.options.headers['Accept'], 'application/json');
    });

    test('Given the application client '
        'When its interceptors are listed '
        'Then there is no cache interceptor — only the bearer token '
        '(Testing Specification §6.4, FR-DA-12)', () {
      final dio = createHttpClient(
        baseUrl: Uri.parse('https://vault.example'),
        readToken: () async => null,
      );

      final names = dio.interceptors.map((i) => '${i.runtimeType}').toList();

      expect(
        names.where((name) => name.toLowerCase().contains('cache')),
        isEmpty,
      );
      expect(
        dio.interceptors.whereType<BearerTokenInterceptor>(),
        hasLength(1),
      );
    });

    test('Given a session token '
        'When a request is made '
        'Then the token travels in the Authorization header and never in the '
        'URL or body (FR-DA-04)', () async {
      final leaks = LeakRecorder();
      leaks.adapter.on('POST', '/api/thing', const StubResponse(200, {}));
      final dio = createHttpClient(
        baseUrl: Uri.parse('https://vault.example'),
        readToken: () async => 'TOKEN-MARKER',
        adapter: leaks.adapter,
      );

      await dio.post<Object?>('/api/thing', data: {'name': 'n'});

      expect(
        leaks.adapter.requests.single.headers['Authorization'],
        'Bearer TOKEN-MARKER',
      );
      leaks.expectOnlyIn('TOKEN-MARKER', {LeakChannel.requestHeader});
    });

    test('Given no session token '
        'When a request is made '
        'Then no Authorization header is sent', () async {
      final adapter = StubHttpAdapter()
        ..on('GET', '/api/thing', const StubResponse(200, {}));
      final dio = createHttpClient(
        baseUrl: Uri.parse('https://vault.example'),
        readToken: () async => null,
        adapter: adapter,
      );

      await dio.get<Object?>('/api/thing');

      expect(adapter.requests.single.headers, isNot(contains('Authorization')));
    });

    test('Given a request whose token the API rejects with '
        'authentication_required '
        'When it fails '
        'Then the session is told, once, and nothing is retried (FR-SE-09, '
        'FR-SE-10)', () async {
      var told = 0;
      final adapter = StubHttpAdapter()
        ..on(
          'GET',
          '/api/thing',
          const StubResponse(401, {
            'errors': ['authentication_required'],
          }),
        );
      final dio = createHttpClient(
        baseUrl: Uri.parse('https://vault.example'),
        readToken: () async => 'token',
        onUnauthenticated: () => told++,
        adapter: adapter,
      );

      await expectLater(
        dio.get<Object?>('/api/thing'),
        throwsA(isA<DioException>()),
      );

      expect(told, 1);
      expect(adapter.requests, hasLength(1));
    });

    test('Given a request that carried no token '
        'When the API answers 401 '
        'Then the session is not told, because no session was rejected — a '
        'refused password or second-factor code (UC-04 AF-01)', () async {
      var told = 0;
      final adapter = StubHttpAdapter()
        ..on(
          'POST',
          '/api/auth/2fa/verify',
          const StubResponse(401, {
            'errors': ['authentication_required'],
          }),
        );
      final dio = createHttpClient(
        baseUrl: Uri.parse('https://vault.example'),
        readToken: () async => null,
        onUnauthenticated: () => told++,
        adapter: adapter,
      );

      await expectLater(
        dio.post<Object?>('/api/auth/2fa/verify', data: const {}),
        throwsA(isA<DioException>()),
      );

      expect(told, 0);
    });

    for (final (code, why) in const [
      ('vault_access_required', 'a valid session whose vault is locked'),
      ('No.', 'a refusal that states no token rejection'),
    ]) {
      test('Given a request that carried a token '
          'When the API answers 401 with $code '
          'Then the session is not told, because it rejected no token — '
          '$why (FR-SE-09)', () async {
        var told = 0;
        final adapter = StubHttpAdapter()
          ..on(
            'GET',
            '/api/accounts/me',
            StubResponse(401, {
              'errors': [code],
            }),
          );
        final dio = createHttpClient(
          baseUrl: Uri.parse('https://vault.example'),
          readToken: () async => 'token',
          onUnauthenticated: () => told++,
          adapter: adapter,
        );

        await expectLater(
          dio.get<Object?>('/api/accounts/me'),
          throwsA(isA<DioException>()),
        );

        expect(told, 0);
      });
    }

    test('Given a request that fails for another reason '
        'When it fails '
        'Then the session is not told', () async {
      var told = 0;
      final adapter = StubHttpAdapter()
        ..on('GET', '/api/thing', const StubResponse(403));
      final dio = createHttpClient(
        baseUrl: Uri.parse('https://vault.example'),
        readToken: () async => 'token',
        onUnauthenticated: () => told++,
        adapter: adapter,
      );

      await expectLater(
        dio.get<Object?>('/api/thing'),
        throwsA(isA<DioException>()),
      );

      expect(told, 0);
    });
  });

  group('httpClientProvider', () {
    ProviderContainer container({required String address}) {
      final container = ProviderContainer(
        overrides: [
          appConfigProvider.overrideWithValue(
            AppConfig(apiBaseUrl: address, allowPlainHttp: false),
          ),
          preferencesStoreProvider.overrideWithValue(
            RecordingPreferencesStore(),
          ),
          secureStoreProvider.overrideWithValue(RecordingSecureStore()),
        ],
      );
      addTearDown(container.dispose);
      return container;
    }

    test('Given an adopted instance '
        'When the client is read '
        'Then it points at that instance and nowhere else (FR-PV-04)', () {
      final dio = container(address: 'https://vault.example')
          .read(httpClientProvider);

      expect(dio.options.baseUrl, 'https://vault.example');
    });

    test('Given no adopted instance '
        'When the client is read '
        'Then it refuses rather than guessing a destination', () {
      expect(
        () => container(address: '').read(httpClientProvider),
        throwsA(anything),
      );
    });

    test('Given a session held in memory for this run '
        'When a request is made '
        'Then the token is attached as a header, exactly like a stored one '
        '(UC-03 AF-05, FR-DA-04)', () async {
      final secure = RecordingSecureStore()
        ..failure = const SecureStoreUnavailableException('x');
      final c = ProviderContainer(
        overrides: [
          appConfigProvider.overrideWithValue(
            const AppConfig(
              apiBaseUrl: 'https://vault.example',
              allowPlainHttp: false,
            ),
          ),
          preferencesStoreProvider.overrideWithValue(
            RecordingPreferencesStore(),
          ),
          secureStoreProvider.overrideWithValue(secure),
        ],
      );
      addTearDown(c.dispose);
      c
          .read(sessionProvider.notifier)
          .establishForThisRun(token: 'TOKEN-MARKER', accountId: 'acct-1');
      final adapter = StubHttpAdapter()
        ..on('GET', '/api/accounts/me', const StubResponse(200, {}));
      final dio = c.read(httpClientProvider)..httpClientAdapter = adapter;

      await dio.get<Object?>('/api/accounts/me');

      expect(
        adapter.requests.single.headers['Authorization'],
        'Bearer TOKEN-MARKER',
      );
      expect('${adapter.requests.single.uri}', isNot(contains('TOKEN-MARKER')));
    });

    test('Given unavailable secure storage and no session '
        'When a request is made '
        'Then it is sent without a token rather than failing', () async {
      final c = ProviderContainer(
        overrides: [
          appConfigProvider.overrideWithValue(
            const AppConfig(
              apiBaseUrl: 'https://vault.example',
              allowPlainHttp: false,
            ),
          ),
          preferencesStoreProvider.overrideWithValue(
            RecordingPreferencesStore(),
          ),
          secureStoreProvider.overrideWithValue(
            RecordingSecureStore()
              ..failure = const SecureStoreUnavailableException('x'),
          ),
        ],
      );
      addTearDown(c.dispose);
      final adapter = StubHttpAdapter()
        ..on('POST', '/api/auth/login', const StubResponse(200, {}));
      final dio = c.read(httpClientProvider)..httpClientAdapter = adapter;

      await dio.post<Object?>('/api/auth/login', data: const {});

      expect(adapter.requests.single.headers, isNot(contains('Authorization')));
    });

    test(
      'Given a signed-in session '
      'When the API rejects the token '
      'Then the session ends and sign-in will say so (UC-06 AF-04)',
      () async {
        final c = container(address: 'https://vault.example');
        await c
            .read(sessionProvider.notifier)
            .establish(token: 'token', accountId: 'acct-1');
        final adapter = StubHttpAdapter()
          ..on(
            'GET',
            '/api/accounts/me',
            const StubResponse(401, {
              'errors': ['authentication_required'],
            }),
          );
        final dio = c.read(httpClientProvider)..httpClientAdapter = adapter;

        await expectLater(
          dio.get<Object?>('/api/accounts/me'),
          throwsA(isA<DioException>()),
        );
        await pumpEventQueue();

        expect(c.read(sessionProvider), const SignedOut());
        expect(c.read(sessionNoticeProvider), {SessionNotice.sessionEnded});
      },
    );

    test('Given a signed-in session '
        'When the API answers 401 vault_access_required '
        'Then the session stays signed in (FR-SE-09)', () async {
      final c = container(address: 'https://vault.example');
      await c
          .read(sessionProvider.notifier)
          .establish(token: 'token', accountId: 'acct-1');
      final adapter = StubHttpAdapter()
        ..on(
          'GET',
          '/api/accounts/me',
          const StubResponse(401, {
            'errors': ['vault_access_required'],
          }),
        );
      final dio = c.read(httpClientProvider)..httpClientAdapter = adapter;

      await expectLater(
        dio.get<Object?>('/api/accounts/me'),
        throwsA(isA<DioException>()),
      );
      await pumpEventQueue();

      expect(c.read(sessionProvider), const SignedIn(accountId: 'acct-1'));
    });
  });
}
