// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveRecordOutput _$MoveRecordOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['recordId', 'folderId', 'revision', 'serverSequence'],
    disallowNullValues: const ['recordId', 'revision', 'serverSequence'],
  );
  return MoveRecordOutput(
    recordId: json['recordId'] as String?,
    folderId: json['folderId'] as String?,
    revision: MoveRecordOutput._read_revision(json['revision']),
    serverSequence: MoveRecordOutput._read_serverSequence(
      json['serverSequence'],
    ),
  );
}

Map<String, dynamic> _$MoveRecordOutputToJson(MoveRecordOutput instance) =>
    <String, dynamic>{
      'recordId': ?instance.recordId,
      'folderId': ?instance.folderId,
      'revision': ?MoveRecordOutput._write_revision(instance.revision),
      'serverSequence': ?MoveRecordOutput._write_serverSequence(
        instance.serverSequence,
      ),
    };
