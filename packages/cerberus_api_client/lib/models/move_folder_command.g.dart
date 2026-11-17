// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_folder_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFolderCommand _$MoveFolderCommandFromJson(Map<String, dynamic> json) =>
    MoveFolderCommand(
      expectedRevision: (json['expectedRevision'] as num).toInt(),
      parentFolderId: json['parentFolderId'] as String?,
    );

Map<String, dynamic> _$MoveFolderCommandToJson(MoveFolderCommand instance) =>
    <String, dynamic>{
      'expectedRevision': instance.expectedRevision,
      'parentFolderId': instance.parentFolderId,
    };
