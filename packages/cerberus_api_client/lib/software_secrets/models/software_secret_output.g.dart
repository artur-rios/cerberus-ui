// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_secret_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareSecretOutput _$SoftwareSecretOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'ownerAccountId',
      'grantId',
      'grantRevision',
      'target',
      'provisioning',
      'recipientKey',
      'authorKey',
    ],
    requiredKeys: const [
      'ownerAccountId',
      'grantId',
      'grantRevision',
      'target',
      'provisioning',
      'recipientKey',
      'authorKey',
    ],
    disallowNullValues: const [
      'ownerAccountId',
      'grantId',
      'grantRevision',
      'target',
      'provisioning',
      'recipientKey',
      'authorKey',
    ],
  );
  return SoftwareSecretOutput(
    ownerAccountId: json['ownerAccountId'] as String,
    grantId: json['grantId'] as String,
    grantRevision: SoftwareSecretOutput._read_grantRevision(
      json['grantRevision'],
    ),
    target: SoftwareSecretResource.fromJson(
      json['target'] as Map<String, dynamic>,
    ),
    provisioning: SoftwareSecretProvisioning.fromJson(
      json['provisioning'] as Map<String, dynamic>,
    ),
    recipientKey: SoftwareRecipientKey.fromJson(
      json['recipientKey'] as Map<String, dynamic>,
    ),
    authorKey: PublicJwk.fromJson(json['authorKey'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SoftwareSecretOutputToJson(
  SoftwareSecretOutput instance,
) => <String, dynamic>{
  'ownerAccountId': instance.ownerAccountId,
  'grantId': instance.grantId,
  'grantRevision': ?SoftwareSecretOutput._write_grantRevision(
    instance.grantRevision,
  ),
  'target': instance.target.toJson(),
  'provisioning': instance.provisioning.toJson(),
  'recipientKey': instance.recipientKey.toJson(),
  'authorKey': instance.authorKey.toJson(),
};
