// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_folder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportFolder _$AccountExportFolderFromJson(Map<String, dynamic> json) =>
    AccountExportFolder(
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
      parentFolderId: json['parentFolderId'] as String?,
      entryType: AccountExportFolderEntryType.fromJson(
        json['entryType'] as String,
      ),
    );

Map<String, dynamic> _$AccountExportFolderToJson(
  AccountExportFolder instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
  'envelope': instance.envelope,
  'parentFolderId': instance.parentFolderId,
  'entryType': _$AccountExportFolderEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportFolderEntryTypeEnumMap = {
  AccountExportFolderEntryType.folder: 'folder',
  AccountExportFolderEntryType.$unknown: r'$unknown',
};
