// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_folder_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFolderOutput _$MoveFolderOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'folderId',
      'parentFolderId',
      'revision',
      'serverSequence',
    ],
    disallowNullValues: const ['folderId', 'revision', 'serverSequence'],
  );
  return MoveFolderOutput(
    folderId: json['folderId'] as String?,
    parentFolderId: json['parentFolderId'] as String?,
    revision: MoveFolderOutput._read_revision(json['revision']),
    serverSequence: MoveFolderOutput._read_serverSequence(
      json['serverSequence'],
    ),
  );
}

Map<String, dynamic> _$MoveFolderOutputToJson(MoveFolderOutput instance) =>
    <String, dynamic>{
      'folderId': ?instance.folderId,
      'parentFolderId': ?instance.parentFolderId,
      'revision': ?MoveFolderOutput._write_revision(instance.revision),
      'serverSequence': ?MoveFolderOutput._write_serverSequence(
        instance.serverSequence,
      ),
    };
