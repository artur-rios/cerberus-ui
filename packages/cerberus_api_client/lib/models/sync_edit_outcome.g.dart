// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_edit_outcome.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncEditOutcome _$SyncEditOutcomeFromJson(Map<String, dynamic> json) =>
    SyncEditOutcome(
      operationId: json['operationId'] as String,
      resourceKind: SyncEditOutcomeResourceKind.fromJson(
        json['resourceKind'] as String,
      ),
      resourceId: json['resourceId'] as String,
      status: SyncEditOutcomeStatus.fromJson(json['status'] as String),
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$SyncEditOutcomeToJson(
  SyncEditOutcome instance,
) => <String, dynamic>{
  'operationId': instance.operationId,
  'resourceKind': _$SyncEditOutcomeResourceKindEnumMap[instance.resourceKind]!,
  'resourceId': instance.resourceId,
  'status': _$SyncEditOutcomeStatusEnumMap[instance.status]!,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt?.toIso8601String(),
};

const _$SyncEditOutcomeResourceKindEnumMap = {
  SyncEditOutcomeResourceKind.profile: 'profile',
  SyncEditOutcomeResourceKind.record: 'record',
  SyncEditOutcomeResourceKind.folder: 'folder',
  SyncEditOutcomeResourceKind.collection: 'collection',
  SyncEditOutcomeResourceKind.$unknown: r'$unknown',
};

const _$SyncEditOutcomeStatusEnumMap = {
  SyncEditOutcomeStatus.applied: 'applied',
  SyncEditOutcomeStatus.superseded: 'superseded',
  SyncEditOutcomeStatus.denied: 'denied',
  SyncEditOutcomeStatus.permanentlyDeleted: 'permanently-deleted',
  SyncEditOutcomeStatus.$unknown: r'$unknown',
};
