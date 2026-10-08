// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_proof_challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultProofChallenge _$VaultProofChallengeFromJson(Map<String, dynamic> json) =>
    VaultProofChallenge(
      format: json['format'] as String?,
      challengeId: json['challengeId'] as String?,
      nonce: json['nonce'] as String?,
      operation: json['operation'] as String?,
      identityId: json['identityId'] as String?,
      accountId: json['accountId'] as String?,
      scopeKind: json['scopeKind'] as String?,
      scopeId: json['scopeId'] as String?,
      keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
      protectionRevision: (json['protectionRevision'] as num?)?.toInt(),
      generation: (json['generation'] as num?)?.toInt(),
      requestHash: json['requestHash'] as String?,
      issuedAt: (json['issuedAt'] as num?)?.toInt(),
      expiresAt: (json['expiresAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VaultProofChallengeToJson(
  VaultProofChallenge instance,
) => <String, dynamic>{
  'format': instance.format,
  'challengeId': instance.challengeId,
  'nonce': instance.nonce,
  'operation': instance.operation,
  'identityId': instance.identityId,
  'accountId': instance.accountId,
  'scopeKind': instance.scopeKind,
  'scopeId': instance.scopeId,
  'keyEpoch': instance.keyEpoch,
  'protectionRevision': instance.protectionRevision,
  'generation': instance.generation,
  'requestHash': instance.requestHash,
  'issuedAt': instance.issuedAt,
  'expiresAt': instance.expiresAt,
};
