// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_collection_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeCollectionAccessCommand _$ChangeCollectionAccessCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'access', 'keyEnvelope'],
    requiredKeys: const ['expectedRevision', 'access', 'keyEnvelope'],
    disallowNullValues: const ['expectedRevision', 'keyEnvelope'],
  );
  return ChangeCollectionAccessCommand(
    expectedRevision: ChangeCollectionAccessCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    access: json['access'] as String?,
    keyEnvelope: RecipientEnvelope.fromJson(
      json['keyEnvelope'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$ChangeCollectionAccessCommandToJson(
  ChangeCollectionAccessCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?ChangeCollectionAccessCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'access': instance.access,
  'keyEnvelope': instance.keyEnvelope.toJson(),
};
