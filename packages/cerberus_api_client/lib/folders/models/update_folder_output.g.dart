// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_folder_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateFolderOutput _$UpdateFolderOutputFromJson(Map<String, dynamic> json) {
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
  return UpdateFolderOutput(
    folderId: json['folderId'] as String?,
    revision: UpdateFolderOutput._read_revision(json['revision']),
    serverSequence: UpdateFolderOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: UpdateFolderOutput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$UpdateFolderOutputToJson(UpdateFolderOutput instance) =>
    <String, dynamic>{
      'folderId': ?instance.folderId,
      'revision': ?UpdateFolderOutput._write_revision(instance.revision),
      'serverSequence': ?UpdateFolderOutput._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?UpdateFolderOutput._write_editedAt(instance.editedAt),
    };
