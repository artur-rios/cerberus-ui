// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_trash_operation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportTrashOperation _$AccountExportTrashOperationFromJson(
  Map<String, dynamic> json,
) => AccountExportTrashOperation(
  operationId: json['operationId'] as String,
  rootKind: AccountExportTrashOperationRootKind.fromJson(
    json['rootKind'] as String,
  ),
  rootId: json['rootId'] as String,
  deletedAt: DateTime.parse(json['deletedAt'] as String),
  purgeAt: DateTime.parse(json['purgeAt'] as String),
  entryType: AccountExportTrashOperationEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportTrashOperationToJson(
  AccountExportTrashOperation instance,
) => <String, dynamic>{
  'operationId': instance.operationId,
  'rootKind': _$AccountExportTrashOperationRootKindEnumMap[instance.rootKind]!,
  'rootId': instance.rootId,
  'deletedAt': instance.deletedAt.toIso8601String(),
  'purgeAt': instance.purgeAt.toIso8601String(),
  'entryType':
      _$AccountExportTrashOperationEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportTrashOperationRootKindEnumMap = {
  AccountExportTrashOperationRootKind.profile: 'profile',
  AccountExportTrashOperationRootKind.record: 'record',
  AccountExportTrashOperationRootKind.folder: 'folder',
  AccountExportTrashOperationRootKind.collection: 'collection',
  AccountExportTrashOperationRootKind.$unknown: r'$unknown',
};

const _$AccountExportTrashOperationEntryTypeEnumMap = {
  AccountExportTrashOperationEntryType.trashOperation: 'trash-operation',
  AccountExportTrashOperationEntryType.$unknown: r'$unknown',
};
