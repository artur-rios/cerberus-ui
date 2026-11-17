// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportRelationship _$AccountExportRelationshipFromJson(
  Map<String, dynamic> json,
) => AccountExportRelationship(
  relationshipKind: AccountExportRelationshipRelationshipKind.fromJson(
    json['relationshipKind'] as String,
  ),
  sourceKind: AccountExportRelationshipSourceKind.fromJson(
    json['sourceKind'] as String,
  ),
  sourceId: json['sourceId'] as String,
  targetKind: AccountExportRelationshipTargetKind.fromJson(
    json['targetKind'] as String,
  ),
  targetId: json['targetId'] as String,
  operationId: json['operationId'] as String?,
  entryType: AccountExportRelationshipEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportRelationshipToJson(
  AccountExportRelationship instance,
) => <String, dynamic>{
  'relationshipKind':
      _$AccountExportRelationshipRelationshipKindEnumMap[instance
          .relationshipKind]!,
  'sourceKind':
      _$AccountExportRelationshipSourceKindEnumMap[instance.sourceKind]!,
  'sourceId': instance.sourceId,
  'targetKind':
      _$AccountExportRelationshipTargetKindEnumMap[instance.targetKind]!,
  'targetId': instance.targetId,
  'operationId': instance.operationId,
  'entryType': _$AccountExportRelationshipEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportRelationshipRelationshipKindEnumMap = {
  AccountExportRelationshipRelationshipKind.current: 'current',
  AccountExportRelationshipRelationshipKind.historical: 'historical',
  AccountExportRelationshipRelationshipKind.$unknown: r'$unknown',
};

const _$AccountExportRelationshipSourceKindEnumMap = {
  AccountExportRelationshipSourceKind.profile: 'profile',
  AccountExportRelationshipSourceKind.collection: 'collection',
  AccountExportRelationshipSourceKind.record: 'record',
  AccountExportRelationshipSourceKind.folder: 'folder',
  AccountExportRelationshipSourceKind.$unknown: r'$unknown',
};

const _$AccountExportRelationshipTargetKindEnumMap = {
  AccountExportRelationshipTargetKind.record: 'record',
  AccountExportRelationshipTargetKind.folder: 'folder',
  AccountExportRelationshipTargetKind.collection: 'collection',
  AccountExportRelationshipTargetKind.$unknown: r'$unknown',
};

const _$AccountExportRelationshipEntryTypeEnumMap = {
  AccountExportRelationshipEntryType.relationship: 'relationship',
  AccountExportRelationshipEntryType.$unknown: r'$unknown',
};
