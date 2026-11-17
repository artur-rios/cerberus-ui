// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_folder_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteFolderCommand _$DeleteFolderCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return DeleteFolderCommand(
    expectedRevision: DeleteFolderCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$DeleteFolderCommandToJson(
  DeleteFolderCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?DeleteFolderCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
};
