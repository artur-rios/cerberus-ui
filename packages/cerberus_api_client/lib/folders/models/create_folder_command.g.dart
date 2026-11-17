// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFolderCommand _$CreateFolderCommandFromJson(Map<String, dynamic> json) {
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
  return CreateFolderCommand(
    folderId: json['folderId'] as String,
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: CreateFolderCommand._read_editedAt(json['editedAt']),
    profileIds: (json['profileIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    parentFolderId: json['parentFolderId'] as String?,
  );
}

Map<String, dynamic> _$CreateFolderCommandToJson(
  CreateFolderCommand instance,
) => <String, dynamic>{
  'folderId': instance.folderId,
  'envelope': instance.envelope.toJson(),
  'editedAt': ?CreateFolderCommand._write_editedAt(instance.editedAt),
  'profileIds': instance.profileIds,
  'parentFolderId': ?instance.parentFolderId,
};
