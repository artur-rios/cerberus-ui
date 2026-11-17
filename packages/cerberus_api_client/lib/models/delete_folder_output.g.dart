// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_folder_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteFolderOutput _$DeleteFolderOutputFromJson(Map<String, dynamic> json) =>
    DeleteFolderOutput(
      folderId: json['folderId'] as String?,
      trashOperationId: json['trashOperationId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      purgeAt: json['purgeAt'] == null
          ? null
          : DateTime.parse(json['purgeAt'] as String),
    );

Map<String, dynamic> _$DeleteFolderOutputToJson(DeleteFolderOutput instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'trashOperationId': instance.trashOperationId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'purgeAt': instance.purgeAt?.toIso8601String(),
    };
