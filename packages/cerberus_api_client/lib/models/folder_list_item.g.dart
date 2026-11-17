// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderListItem _$FolderListItemFromJson(Map<String, dynamic> json) =>
    FolderListItem(
      folderId: json['folderId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
      serverSequence: (json['serverSequence'] as num?)?.toInt(),
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
      envelope: json['envelope'] == null
          ? null
          : EncryptedEnvelope.fromJson(
              json['envelope'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FolderListItemToJson(FolderListItem instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt?.toIso8601String(),
      'envelope': instance.envelope,
    };
