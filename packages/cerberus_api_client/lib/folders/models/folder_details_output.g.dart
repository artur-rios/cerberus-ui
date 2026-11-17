// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_details_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderDetailsOutput _$FolderDetailsOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'folderId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
      'profileIds',
      'parentFolderId',
      'collectionIds',
    ],
    requiredKeys: const ['envelope'],
    disallowNullValues: const [
      'folderId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
  );
  return FolderDetailsOutput(
    folderId: json['folderId'] as String?,
    revision: FolderDetailsOutput._read_revision(json['revision']),
    serverSequence: FolderDetailsOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: FolderDetailsOutput._read_editedAt(json['editedAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    profileIds: (json['profileIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    parentFolderId: json['parentFolderId'] as String?,
    collectionIds: (json['collectionIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$FolderDetailsOutputToJson(
  FolderDetailsOutput instance,
) => <String, dynamic>{
  'folderId': ?instance.folderId,
  'revision': ?FolderDetailsOutput._write_revision(instance.revision),
  'serverSequence': ?FolderDetailsOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?FolderDetailsOutput._write_editedAt(instance.editedAt),
  'envelope': instance.envelope.toJson(),
  'profileIds': ?instance.profileIds,
  'parentFolderId': ?instance.parentFolderId,
  'collectionIds': ?instance.collectionIds,
};
