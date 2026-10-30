/// `GET /api/vault/protection` answers, shaped exactly as the API's contract
/// defines them (Testing Specification §2.4): the `DataOutput` envelope, the
/// API's message codes and its status codes (cerberus-api
/// `GetVaultProtectionHandler`, `VaultProtectionQueryMessages`).
library;

import 'stub_http_adapter.dart';

/// The vault protection path.
const protectionPath = '/api/vault/protection';

/// The account's protection, found. Every opaque value carries [marker], so a
/// leak assertion can prove none of the protocol material left memory.
StubResponse protectionFound({String marker = 'MATERIAL-MARKER'}) {
  Map<String, Object?> wrapper(String name) => {
    'format': 'cerberus-aes256gcm-v1',
    'keyEpoch': 1,
    'keySalt': '$marker-$name-salt',
    'nonce': '$marker-$name-nonce',
    'ciphertext': '$marker-$name-ciphertext',
    'tag': '$marker-$name-tag',
  };
  Map<String, Object?> jwk(String name) => {
    'crv': 'P-256',
    'kty': 'EC',
    'x': '$marker-$name-x',
    'y': '$marker-$name-y',
  };

  return StubResponse(200, {
    'messages': ['protection_found'],
    'errors': <String>[],
    'timestamp': '2026-10-08T12:00:00Z',
    'success': true,
    'data': {
      'accountId': '6f1c2a54-0d7e-4a8b-9c3e-1b2d3e4f5a6b',
      'protectionRevision': 1,
      'keyEpoch': 1,
      'recoveryGeneration': 1,
      'material': {
        'passwordWrapper': {
          ...wrapper('password'),
          'kdf': {
            'algorithm': 'argon2id',
            'memoryKiB': 65536,
            'iterations': 3,
            'parallelism': 1,
            'salt': '$marker-kdf-salt',
          },
        },
        'recoveryWrapper': {
          ...wrapper('recovery'),
          'generation': 1,
          'proofKeyFingerprint': '$marker-fingerprint',
        },
        'unlockVerifier': jwk('unlock'),
        'recoveryVerifier': jwk('recovery'),
        'recipientKey': jwk('recipient'),
        'authorKey': jwk('author'),
      },
    },
  });
}

/// A refusal: [statusCode] with the API's [error] code. `not_found` (404) is
/// how the API answers an account with no protection, or no active account.
StubResponse protectionRefused(int statusCode, String error) =>
    StubResponse(statusCode, {
      'messages': <String>[],
      'errors': [error],
      'timestamp': '2026-10-08T12:00:00Z',
      'success': false,
    });

/// No protection, or no active account: the API does not tell them apart.
StubResponse protectionNotFound() => protectionRefused(404, 'not_found');
