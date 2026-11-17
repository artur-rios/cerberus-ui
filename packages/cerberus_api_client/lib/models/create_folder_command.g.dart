// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_folder_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateFolderCommand _$CreateFolderCommandFromJson(Map<String, dynamic> json) =>
    CreateFolderCommand(
      folderId: json['folderId'] as String,
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      editedAt: DateTime.parse(json['editedAt'] as String),
      profileIds: (json['profileIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      parentFolderId: json['parentFolderId'] as String?,
    );

Map<String, dynamic> _$CreateFolderCommandToJson(
  CreateFolderCommand instance,
) => <String, dynamic>{
  'folderId': instance.folderId,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
  'profileIds': instance.profileIds,
  'parentFolderId': instance.parentFolderId,
};
