// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_record_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRecordCommand _$UpdateRecordCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'envelope', 'editedAt'],
    requiredKeys: const ['expectedRevision', 'envelope', 'editedAt'],
    disallowNullValues: const ['expectedRevision', 'envelope', 'editedAt'],
  );
  return UpdateRecordCommand(
    expectedRevision: UpdateRecordCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: UpdateRecordCommand._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$UpdateRecordCommandToJson(
  UpdateRecordCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?UpdateRecordCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'envelope': instance.envelope.toJson(),
  'editedAt': ?UpdateRecordCommand._write_editedAt(instance.editedAt),
};
