// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_secret_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareSecretOutput _$SoftwareSecretOutputFromJson(
  Map<String, dynamic> json,
) => SoftwareSecretOutput(
  ownerAccountId: json['ownerAccountId'] as String,
  grantId: json['grantId'] as String,
  grantRevision: (json['grantRevision'] as num).toInt(),
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

Map<String, dynamic> _$SoftwareSecretOutputToJson(
  SoftwareSecretOutput instance,
) => <String, dynamic>{
  'ownerAccountId': instance.ownerAccountId,
  'grantId': instance.grantId,
  'grantRevision': instance.grantRevision,
  'target': instance.target,
  'provisioning': instance.provisioning,
  'recipientKey': instance.recipientKey,
  'authorKey': instance.authorKey,
};
