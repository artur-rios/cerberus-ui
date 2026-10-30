import 'package:cerberus_api_client/export.dart';
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
  });
}
