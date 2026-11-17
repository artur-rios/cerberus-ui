// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_proof_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultProofChallenge _$VaultProofChallengeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'format',
      'challengeId',
      'nonce',
      'operation',
      'identityId',
      'accountId',
      'scopeKind',
      'scopeId',
      'keyEpoch',
      'protectionRevision',
      'generation',
      'requestHash',
      'issuedAt',
      'expiresAt',
    ],
    disallowNullValues: const [
      'challengeId',
      'identityId',
      'accountId',
      'scopeId',
      'keyEpoch',
      'protectionRevision',
      'issuedAt',
      'expiresAt',
    ],
  );
  return VaultProofChallenge(
    format: json['format'] as String?,
    challengeId: json['challengeId'] as String?,
    nonce: json['nonce'] as String?,
    operation: json['operation'] as String?,
    identityId: json['identityId'] as String?,
    accountId: json['accountId'] as String?,
    scopeKind: json['scopeKind'] as String?,
    scopeId: json['scopeId'] as String?,
    keyEpoch: VaultProofChallenge._read_keyEpoch(json['keyEpoch']),
    protectionRevision: VaultProofChallenge._read_protectionRevision(
      json['protectionRevision'],
    ),
    generation: VaultProofChallenge._read_generation(json['generation']),
    requestHash: json['requestHash'] as String?,
    issuedAt: VaultProofChallenge._read_issuedAt(json['issuedAt']),
    expiresAt: VaultProofChallenge._read_expiresAt(json['expiresAt']),
  );
}

Map<String, dynamic> _$VaultProofChallengeToJson(
  VaultProofChallenge instance,
) => <String, dynamic>{
  'format': ?instance.format,
  'challengeId': ?instance.challengeId,
  'nonce': ?instance.nonce,
  'operation': ?instance.operation,
  'identityId': ?instance.identityId,
  'accountId': ?instance.accountId,
  'scopeKind': ?instance.scopeKind,
  'scopeId': ?instance.scopeId,
  'keyEpoch': ?VaultProofChallenge._write_keyEpoch(instance.keyEpoch),
  'protectionRevision': ?VaultProofChallenge._write_protectionRevision(
    instance.protectionRevision,
  ),
  'generation': ?VaultProofChallenge._write_generation(instance.generation),
  'requestHash': ?instance.requestHash,
  'issuedAt': ?VaultProofChallenge._write_issuedAt(instance.issuedAt),
  'expiresAt': ?VaultProofChallenge._write_expiresAt(instance.expiresAt),
};
