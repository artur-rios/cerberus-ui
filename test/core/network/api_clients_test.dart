import 'package:cerberus_api_client/exports.dart';
import 'package:cerberus_ui/core/network/api_clients.dart';
import 'package:cerberus_ui/core/network/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../support/stub_http_adapter.dart';
import '../../support/vault_payloads.dart';

void main() {
  group('The generated client providers', () {
    late StubHttpAdapter adapter;
    late ProviderContainer container;

    setUp(() {
      adapter = StubHttpAdapter();
      container = ProviderContainer(
        overrides: [
          httpClientProvider.overrideWithValue(
            createHttpClient(
              baseUrl: Uri.parse('https://vault.example'),
              readToken: () async => null,
              adapter: adapter,
            ),
          ),
        ],
      );
      addTearDown(container.dispose);
    });

    test('Given the configured client '
        'When the auth client signs in '
        'Then the request goes through it to the adopted instance', () async {
      adapter.on(
        'POST',
        '/api/auth/login',
        const StubResponse(200, {
          'success': true,
          'data': {
            'identity': {'token': 't', 'requiresTwoFactor': false},
          },
        }),
      );

      await container
          .read(authClientProvider)
          .postApiAuthLogin(
            body: const LoginCommand(email: 'e@example.com', password: 'p'),
          );

      expect(
        adapter.requests.single.uri.toString(),
        'https://vault.example/api/auth/login',
      );
    });

    test('Given the configured client '
        'When the account client reads the account '
        'Then the request goes through it to the adopted instance', () async {
      adapter.on(
        'GET',
        '/api/accounts/me',
        const StubResponse(200, {
          'success': true,
          'data': {
            'details': {'format': 'f'},
          },
        }),
      );

      await container.read(accountClientProvider).getApiAccountsMe();

      expect(
        adapter.requests.single.uri.toString(),
        'https://vault.example/api/accounts/me',
      );
    });

    test('Given the configured client '
        'When the vault client reads the protection '
        'Then the request goes through it to the adopted instance', () async {
      adapter.on('GET', '/api/vault/protection', protectionFound());

      await container.read(vaultClientProvider).getApiVaultProtection();

      expect(
        adapter.requests.single.uri.toString(),
        'https://vault.example/api/vault/protection',
      );
    });

    test('Given an operation the contract answers with 201 '
        'When the client calls it and the API answers 201 '
        'Then the answer is decoded as the success it is', () async {
      adapter.on(
        'POST',
        '/api/accounts',
        const StubResponse(201, {
          'messages': ['account_registered'],
          'errors': <String>[],
          'timestamp': '2026-10-08T12:00:00Z',
          'success': true,
          'data': {'id': 'a-1', 'revision': 1, 'replayed': false},
        }),
      );

      final output = await container
          .read(accountClientProvider)
          .postApiAccounts(body: const RegisterAccountCommand());

      expect(output.data?.id, 'a-1');
    });
  });

  group('The generated DTOs', () {
    test(
      'Given an enum value the client does not know '
      'When it is decoded '
      'Then it is kept as an unknown value rather than failing the answer',
      () {
        final status = HealthComponentStatus.fromJson('degraded');

        expect(status, isA<HealthComponentStatusUnknown>());
        expect(status.toJson(), 'degraded');
      },
    );

    test('Given a date-time the API sends with an offset '
        'When it is decoded '
        'Then it is the same instant, in UTC', () {
      final login = HeimdallLogin.fromJson({
        'requiresTwoFactor': false,
        'expiresAt': '2026-10-08T10:00:00-03:00',
      });

      expect(login.expiresAt, DateTime.utc(2026, 10, 8, 13));
      expect(login.expiresAt!.isUtc, isTrue);
    });
  });
}
