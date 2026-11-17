// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_folder_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncFolderUpdate _$SyncFolderUpdateFromJson(Map<String, dynamic> json) =>
    SyncFolderUpdate(
      input: SyncContentEditInput.fromJson(
        json['input'] as Map<String, dynamic>,
      ),
      operationId: json['operationId'] as String,
      editType: SyncFolderUpdateEditType.fromJson(json['editType'] as String),
    );

Map<String, dynamic> _$SyncFolderUpdateToJson(SyncFolderUpdate instance) =>
    <String, dynamic>{
      'input': instance.input,
      'operationId': instance.operationId,
      'editType': _$SyncFolderUpdateEditTypeEnumMap[instance.editType]!,
    };

const _$SyncFolderUpdateEditTypeEnumMap = {
  SyncFolderUpdateEditType.folderUpdate: 'folder-update',
  SyncFolderUpdateEditType.$unknown: r'$unknown',
};
