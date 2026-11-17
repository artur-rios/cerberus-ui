// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFolderOutput _$CreateFolderOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['folderId', 'revision', 'serverSequence', 'editedAt'],
    disallowNullValues: const [
      'folderId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
  );
  return CreateFolderOutput(
    folderId: json['folderId'] as String?,
    revision: CreateFolderOutput._read_revision(json['revision']),
    serverSequence: CreateFolderOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: CreateFolderOutput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$CreateFolderOutputToJson(CreateFolderOutput instance) =>
    <String, dynamic>{
      'folderId': ?instance.folderId,
      'revision': ?CreateFolderOutput._write_revision(instance.revision),
      'serverSequence': ?CreateFolderOutput._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?CreateFolderOutput._write_editedAt(instance.editedAt),
    };
