// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_create_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderCreateInput _$FolderCreateInputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'folderId',
      'envelope',
      'editedAt',
      'profileIds',
      'parentFolderId',
    ],
    requiredKeys: const ['folderId', 'envelope', 'editedAt', 'profileIds'],
    disallowNullValues: const ['folderId', 'envelope', 'editedAt'],
  );
  return FolderCreateInput(
    folderId: json['folderId'] as String,
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: FolderCreateInput._read_editedAt(json['editedAt']),
    profileIds: (json['profileIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    parentFolderId: json['parentFolderId'] as String?,
  );
}

Map<String, dynamic> _$FolderCreateInputToJson(FolderCreateInput instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'envelope': instance.envelope.toJson(),
      'editedAt': ?FolderCreateInput._write_editedAt(instance.editedAt),
      'profileIds': instance.profileIds,
      'parentFolderId': ?instance.parentFolderId,
    };
