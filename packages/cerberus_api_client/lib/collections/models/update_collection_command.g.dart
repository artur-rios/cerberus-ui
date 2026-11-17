// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCollectionCommand _$UpdateCollectionCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'envelope', 'editedAt'],
    requiredKeys: const ['expectedRevision', 'envelope', 'editedAt'],
    disallowNullValues: const ['expectedRevision', 'envelope', 'editedAt'],
  );
  return UpdateCollectionCommand(
    expectedRevision: UpdateCollectionCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: UpdateCollectionCommand._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$UpdateCollectionCommandToJson(
  UpdateCollectionCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?UpdateCollectionCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'envelope': instance.envelope.toJson(),
  'editedAt': ?UpdateCollectionCommand._write_editedAt(instance.editedAt),
};
