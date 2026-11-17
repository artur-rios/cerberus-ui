// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRecordOutput _$CreateRecordOutputFromJson(Map<String, dynamic> json) {
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
  return CreateRecordOutput(
    recordId: json['recordId'] as String?,
    revision: CreateRecordOutput._read_revision(json['revision']),
    serverSequence: CreateRecordOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: CreateRecordOutput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$CreateRecordOutputToJson(CreateRecordOutput instance) =>
    <String, dynamic>{
      'recordId': ?instance.recordId,
      'revision': ?CreateRecordOutput._write_revision(instance.revision),
      'serverSequence': ?CreateRecordOutput._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?CreateRecordOutput._write_editedAt(instance.editedAt),
    };
