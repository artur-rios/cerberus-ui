// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFolderOutput _$CreateFolderOutputFromJson(Map<String, dynamic> json) =>
    CreateFolderOutput(
      folderId: json['folderId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$CreateFolderOutputToJson(CreateFolderOutput instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt?.toIso8601String(),
    };
