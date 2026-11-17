// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_folder_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashFolderItem _$TrashFolderItemFromJson(Map<String, dynamic> json) =>
    TrashFolderItem(
      operationId: json['operationId'] as String,
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
      deletedAt: DateTime.parse(json['deletedAt'] as String),
      purgeAt: DateTime.parse(json['purgeAt'] as String),
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      kind: TrashFolderItemKind.fromJson(json['kind'] as String),
    );

Map<String, dynamic> _$TrashFolderItemToJson(TrashFolderItem instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'resourceId': instance.resourceId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt.toIso8601String(),
      'deletedAt': instance.deletedAt.toIso8601String(),
      'purgeAt': instance.purgeAt.toIso8601String(),
      'envelope': instance.envelope,
      'kind': _$TrashFolderItemKindEnumMap[instance.kind]!,
    };

const _$TrashFolderItemKindEnumMap = {
  TrashFolderItemKind.folder: 'folder',
  TrashFolderItemKind.$unknown: r'$unknown',
};
