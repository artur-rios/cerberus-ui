// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_folder_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncFolderData _$SyncFolderDataFromJson(Map<String, dynamic> json) =>
    SyncFolderData(
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      resourceType: SyncFolderDataResourceType.fromJson(
        json['resourceType'] as String,
      ),
    );

Map<String, dynamic> _$SyncFolderDataToJson(
  SyncFolderData instance,
) => <String, dynamic>{
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'envelope': instance.envelope,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'resourceType': _$SyncFolderDataResourceTypeEnumMap[instance.resourceType]!,
};

const _$SyncFolderDataResourceTypeEnumMap = {
  SyncFolderDataResourceType.folder: 'folder',
  SyncFolderDataResourceType.$unknown: r'$unknown',
};
