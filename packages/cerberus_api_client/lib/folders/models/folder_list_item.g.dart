// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderListItem _$FolderListItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'folderId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
    disallowNullValues: const [
      'folderId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
  );
  return FolderListItem(
    folderId: json['folderId'] as String?,
    revision: FolderListItem._read_revision(json['revision']),
    serverSequence: FolderListItem._read_serverSequence(json['serverSequence']),
    editedAt: FolderListItem._read_editedAt(json['editedAt']),
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FolderListItemToJson(FolderListItem instance) =>
    <String, dynamic>{
      'folderId': ?instance.folderId,
      'revision': ?FolderListItem._write_revision(instance.revision),
      'serverSequence': ?FolderListItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?FolderListItem._write_editedAt(instance.editedAt),
      'envelope': ?instance.envelope?.toJson(),
    };
