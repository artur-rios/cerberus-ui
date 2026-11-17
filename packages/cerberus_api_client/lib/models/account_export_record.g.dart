// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportRecord _$AccountExportRecordFromJson(Map<String, dynamic> json) =>
    AccountExportRecord(
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      purgeAt: json['purgeAt'] == null
          ? null
          : DateTime.parse(json['purgeAt'] as String),
      envelope: json['envelope'] as String?,
      folderId: json['folderId'] as String?,
      entryType: AccountExportRecordEntryType.fromJson(
        json['entryType'] as String,
      ),
    );

Map<String, dynamic> _$AccountExportRecordToJson(
  AccountExportRecord instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
  'envelope': instance.envelope,
  'folderId': instance.folderId,
  'entryType': _$AccountExportRecordEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportRecordEntryTypeEnumMap = {
  AccountExportRecordEntryType.record: 'record',
  AccountExportRecordEntryType.$unknown: r'$unknown',
};
