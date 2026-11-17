// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_secret_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareSecretResource _$SoftwareSecretResourceFromJson(
  Map<String, dynamic> json,
) => SoftwareSecretResource(
  kind: json['kind'] as String?,
  id: json['id'] as String,
  revision: (json['revision'] as num).toInt(),
  keyEpoch: (json['keyEpoch'] as num).toInt(),
  envelope: EncryptedEnvelope.fromJson(
    json['envelope'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SoftwareSecretResourceToJson(
  SoftwareSecretResource instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'id': instance.id,
  'revision': instance.revision,
  'keyEpoch': instance.keyEpoch,
  'envelope': instance.envelope,
};
