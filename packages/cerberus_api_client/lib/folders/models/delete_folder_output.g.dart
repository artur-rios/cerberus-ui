// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_folder_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteFolderOutput _$DeleteFolderOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'folderId',
      'trashOperationId',
      'revision',
      'serverSequence',
      'deletedAt',
      'purgeAt',
    ],
    disallowNullValues: const [
      'folderId',
      'trashOperationId',
      'revision',
      'serverSequence',
      'deletedAt',
      'purgeAt',
    ],
  );
  return DeleteFolderOutput(
    folderId: json['folderId'] as String?,
    trashOperationId: json['trashOperationId'] as String?,
    revision: DeleteFolderOutput._read_revision(json['revision']),
    serverSequence: DeleteFolderOutput._read_serverSequence(
      json['serverSequence'],
    ),
    deletedAt: DeleteFolderOutput._read_deletedAt(json['deletedAt']),
    purgeAt: DeleteFolderOutput._read_purgeAt(json['purgeAt']),
  );
}

Map<String, dynamic> _$DeleteFolderOutputToJson(DeleteFolderOutput instance) =>
    <String, dynamic>{
      'folderId': ?instance.folderId,
      'trashOperationId': ?instance.trashOperationId,
      'revision': ?DeleteFolderOutput._write_revision(instance.revision),
      'serverSequence': ?DeleteFolderOutput._write_serverSequence(
        instance.serverSequence,
      ),
      'deletedAt': ?DeleteFolderOutput._write_deletedAt(instance.deletedAt),
      'purgeAt': ?DeleteFolderOutput._write_purgeAt(instance.purgeAt),
    };
