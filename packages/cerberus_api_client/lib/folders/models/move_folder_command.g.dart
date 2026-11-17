// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_folder_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFolderCommand _$MoveFolderCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'parentFolderId'],
    requiredKeys: const ['expectedRevision', 'parentFolderId'],
    disallowNullValues: const ['expectedRevision'],
  );
  return MoveFolderCommand(
    expectedRevision: MoveFolderCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    parentFolderId: json['parentFolderId'] as String?,
  );
}

Map<String, dynamic> _$MoveFolderCommandToJson(MoveFolderCommand instance) =>
    <String, dynamic>{
      'expectedRevision': ?MoveFolderCommand._write_expectedRevision(
        instance.expectedRevision,
      ),
      'parentFolderId': instance.parentFolderId,
    };
