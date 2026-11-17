// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_authorization_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflineAuthorizationOutput _$OfflineAuthorizationOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'lease',
      'accountId',
      'profileId',
      'keyEpoch',
      'protectionRevision',
      'policyRevision',
      'revocationGeneration',
      'grantRevisions',
      'renewalEnabled',
      'issuedAt',
      'expiresAt',
    ],
    disallowNullValues: const [
      'accountId',
      'profileId',
      'keyEpoch',
      'protectionRevision',
      'policyRevision',
      'revocationGeneration',
      'renewalEnabled',
      'issuedAt',
    ],
  );
  return OfflineAuthorizationOutput(
    lease: json['lease'] as String?,
    accountId: json['accountId'] as String?,
    profileId: json['profileId'] as String?,
    keyEpoch: OfflineAuthorizationOutput._read_keyEpoch(json['keyEpoch']),
    protectionRevision: OfflineAuthorizationOutput._read_protectionRevision(
      json['protectionRevision'],
    ),
    policyRevision: OfflineAuthorizationOutput._read_policyRevision(
      json['policyRevision'],
    ),
    revocationGeneration: OfflineAuthorizationOutput._read_revocationGeneration(
      json['revocationGeneration'],
    ),
    grantRevisions: (json['grantRevisions'] as List<dynamic>?)
        ?.map((e) => OfflineGrantRevision.fromJson(e as Map<String, dynamic>))
        .toList(),
    renewalEnabled: json['renewalEnabled'] as bool?,
    issuedAt: OfflineAuthorizationOutput._read_issuedAt(json['issuedAt']),
    expiresAt: OfflineAuthorizationOutput._read_expiresAt(json['expiresAt']),
  );
}

Map<String, dynamic> _$OfflineAuthorizationOutputToJson(
  OfflineAuthorizationOutput instance,
) => <String, dynamic>{
  'lease': ?instance.lease,
  'accountId': ?instance.accountId,
  'profileId': ?instance.profileId,
  'keyEpoch': ?OfflineAuthorizationOutput._write_keyEpoch(instance.keyEpoch),
  'protectionRevision': ?OfflineAuthorizationOutput._write_protectionRevision(
    instance.protectionRevision,
  ),
  'policyRevision': ?OfflineAuthorizationOutput._write_policyRevision(
    instance.policyRevision,
  ),
  'revocationGeneration':
      ?OfflineAuthorizationOutput._write_revocationGeneration(
        instance.revocationGeneration,
      ),
  'grantRevisions': ?instance.grantRevisions?.map((e) => e.toJson()).toList(),
  'renewalEnabled': ?instance.renewalEnabled,
  'issuedAt': ?OfflineAuthorizationOutput._write_issuedAt(instance.issuedAt),
  'expiresAt': ?OfflineAuthorizationOutput._write_expiresAt(instance.expiresAt),
};
