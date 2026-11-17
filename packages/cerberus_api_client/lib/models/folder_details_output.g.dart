// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_details_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderDetailsOutput _$FolderDetailsOutputFromJson(Map<String, dynamic> json) =>
    FolderDetailsOutput(
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      folderId: json['folderId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
      profileIds: (json['profileIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      parentFolderId: json['parentFolderId'] as String?,
      collectionIds: (json['collectionIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$FolderDetailsOutputToJson(
  FolderDetailsOutput instance,
) => <String, dynamic>{
  'folderId': instance.folderId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt?.toIso8601String(),
  'envelope': instance.envelope,
  'profileIds': instance.profileIds,
  'parentFolderId': instance.parentFolderId,
  'collectionIds': instance.collectionIds,
};
