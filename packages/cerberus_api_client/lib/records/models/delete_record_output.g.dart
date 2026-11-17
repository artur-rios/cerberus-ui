// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_record_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRecordOutput _$DeleteRecordOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'recordId',
      'trashOperationId',
      'revision',
      'serverSequence',
      'deletedAt',
      'purgeAt',
    ],
    disallowNullValues: const [
      'recordId',
      'trashOperationId',
      'revision',
      'serverSequence',
      'deletedAt',
      'purgeAt',
    ],
  );
  return DeleteRecordOutput(
    recordId: json['recordId'] as String?,
    trashOperationId: json['trashOperationId'] as String?,
    revision: DeleteRecordOutput._read_revision(json['revision']),
    serverSequence: DeleteRecordOutput._read_serverSequence(
      json['serverSequence'],
    ),
    deletedAt: DeleteRecordOutput._read_deletedAt(json['deletedAt']),
    purgeAt: DeleteRecordOutput._read_purgeAt(json['purgeAt']),
  );
}

Map<String, dynamic> _$DeleteRecordOutputToJson(DeleteRecordOutput instance) =>
    <String, dynamic>{
      'recordId': ?instance.recordId,
      'trashOperationId': ?instance.trashOperationId,
      'revision': ?DeleteRecordOutput._write_revision(instance.revision),
      'serverSequence': ?DeleteRecordOutput._write_serverSequence(
        instance.serverSequence,
      ),
      'deletedAt': ?DeleteRecordOutput._write_deletedAt(instance.deletedAt),
      'purgeAt': ?DeleteRecordOutput._write_purgeAt(instance.purgeAt),
    };
