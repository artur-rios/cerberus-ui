// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_authorization_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflineAuthorizationOutput _$OfflineAuthorizationOutputFromJson(
  Map<String, dynamic> json,
) => OfflineAuthorizationOutput(
  lease: json['lease'] as String?,
  accountId: json['accountId'] as String?,
  profileId: json['profileId'] as String?,
  keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
  protectionRevision: (json['protectionRevision'] as num?)?.toInt(),
  policyRevision: (json['policyRevision'] as num?)?.toInt(),
  revocationGeneration: (json['revocationGeneration'] as num?)?.toInt(),
  grantRevisions: (json['grantRevisions'] as List<dynamic>?)
      ?.map((e) => OfflineGrantRevision.fromJson(e as Map<String, dynamic>))
      .toList(),
  renewalEnabled: json['renewalEnabled'] as bool?,
  issuedAt: json['issuedAt'] == null
      ? null
      : DateTime.parse(json['issuedAt'] as String),
  expiresAt: json['expiresAt'] == null
      ? null
      : DateTime.parse(json['expiresAt'] as String),
);

Map<String, dynamic> _$OfflineAuthorizationOutputToJson(
  OfflineAuthorizationOutput instance,
) => <String, dynamic>{
  'lease': instance.lease,
  'accountId': instance.accountId,
  'profileId': instance.profileId,
  'keyEpoch': instance.keyEpoch,
  'protectionRevision': instance.protectionRevision,
  'policyRevision': instance.policyRevision,
  'revocationGeneration': instance.revocationGeneration,
  'grantRevisions': instance.grantRevisions,
  'renewalEnabled': instance.renewalEnabled,
  'issuedAt': instance.issuedAt?.toIso8601String(),
  'expiresAt': instance.expiresAt?.toIso8601String(),
};
