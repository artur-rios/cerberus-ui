// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRecordOutput _$UpdateRecordOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['recordId', 'revision', 'serverSequence', 'editedAt'],
    disallowNullValues: const [
      'recordId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
  );
  return UpdateRecordOutput(
    recordId: json['recordId'] as String?,
    revision: UpdateRecordOutput._read_revision(json['revision']),
    serverSequence: UpdateRecordOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: UpdateRecordOutput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$UpdateRecordOutputToJson(UpdateRecordOutput instance) =>
    <String, dynamic>{
      'recordId': ?instance.recordId,
      'revision': ?UpdateRecordOutput._write_revision(instance.revision),
      'serverSequence': ?UpdateRecordOutput._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?UpdateRecordOutput._write_editedAt(instance.editedAt),
    };
