// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_folder_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFolderOutput _$MoveFolderOutputFromJson(Map<String, dynamic> json) =>
    MoveFolderOutput(
      folderId: json['folderId'] as String?,
      parentFolderId: json['parentFolderId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MoveFolderOutputToJson(MoveFolderOutput instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'parentFolderId': instance.parentFolderId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
    };
