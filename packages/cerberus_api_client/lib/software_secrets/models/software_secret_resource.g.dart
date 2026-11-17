// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_secret_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareSecretResource _$SoftwareSecretResourceFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'id', 'revision', 'keyEpoch', 'envelope'],
    requiredKeys: const ['kind', 'id', 'revision', 'keyEpoch', 'envelope'],
    disallowNullValues: const ['id', 'revision', 'keyEpoch', 'envelope'],
  );
  return SoftwareSecretResource(
    kind: json['kind'] as String?,
    id: json['id'] as String,
    revision: SoftwareSecretResource._read_revision(json['revision']),
    keyEpoch: SoftwareSecretResource._read_keyEpoch(json['keyEpoch']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$SoftwareSecretResourceToJson(
  SoftwareSecretResource instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'id': instance.id,
  'revision': ?SoftwareSecretResource._write_revision(instance.revision),
  'keyEpoch': ?SoftwareSecretResource._write_keyEpoch(instance.keyEpoch),
  'envelope': instance.envelope.toJson(),
};
