// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_secret_provisioning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareSecretProvisioning _$SoftwareSecretProvisioningFromJson(
  Map<String, dynamic> json,
) => SoftwareSecretProvisioning(
  resource: SoftwareSecretResource.fromJson(
    json['resource'] as Map<String, dynamic>,
  ),
  keyEnvelope: RecipientEnvelope.fromJson(
    json['keyEnvelope'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SoftwareSecretProvisioningToJson(
  SoftwareSecretProvisioning instance,
) => <String, dynamic>{
  'resource': instance.resource,
  'keyEnvelope': instance.keyEnvelope,
};
