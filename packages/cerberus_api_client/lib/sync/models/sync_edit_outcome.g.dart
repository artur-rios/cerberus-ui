// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_edit_outcome.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncEditOutcome _$SyncEditOutcomeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'operationId',
      'resourceKind',
      'resourceId',
      'status',
      'revision',
      'serverSequence',
      'editedAt',
    ],
    requiredKeys: const [
      'operationId',
      'resourceKind',
      'resourceId',
      'status',
      'revision',
      'serverSequence',
      'editedAt',
    ],
    disallowNullValues: const [
      'operationId',
      'resourceKind',
      'resourceId',
      'status',
    ],
  );
  return SyncEditOutcome(
    operationId: json['operationId'] as String,
    resourceKind: SyncEditOutcome._read_resourceKind(json['resourceKind']),
    resourceId: json['resourceId'] as String,
    status: SyncEditOutcome._read_status(json['status']),
    revision: SyncEditOutcome._read_revision(json['revision']),
    serverSequence: SyncEditOutcome._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: SyncEditOutcome._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$SyncEditOutcomeToJson(
  SyncEditOutcome instance,
) => <String, dynamic>{
  'operationId': instance.operationId,
  'resourceKind': ?SyncEditOutcome._write_resourceKind(instance.resourceKind),
  'resourceId': instance.resourceId,
  'status': ?SyncEditOutcome._write_status(instance.status),
  'revision': SyncEditOutcome._write_revision(instance.revision),
  'serverSequence': SyncEditOutcome._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': SyncEditOutcome._write_editedAt(instance.editedAt),
};
