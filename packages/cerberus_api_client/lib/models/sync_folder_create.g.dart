// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_folder_create.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncFolderCreate _$SyncFolderCreateFromJson(Map<String, dynamic> json) =>
    SyncFolderCreate(
      input: FolderCreateInput.fromJson(json['input'] as Map<String, dynamic>),
      operationId: json['operationId'] as String,
      editType: SyncFolderCreateEditType.fromJson(json['editType'] as String),
    );

Map<String, dynamic> _$SyncFolderCreateToJson(SyncFolderCreate instance) =>
    <String, dynamic>{
      'input': instance.input,
      'operationId': instance.operationId,
      'editType': _$SyncFolderCreateEditTypeEnumMap[instance.editType]!,
    };

const _$SyncFolderCreateEditTypeEnumMap = {
  SyncFolderCreateEditType.folderCreate: 'folder-create',
  SyncFolderCreateEditType.$unknown: r'$unknown',
};
