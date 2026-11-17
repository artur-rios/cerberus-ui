// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_collection_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashCollectionItem _$TrashCollectionItemFromJson(Map<String, dynamic> json) =>
    TrashCollectionItem(
      keyEpoch: (json['keyEpoch'] as num).toInt(),
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
      kind: TrashCollectionItemKind.fromJson(json['kind'] as String),
    );

Map<String, dynamic> _$TrashCollectionItemToJson(
  TrashCollectionItem instance,
) => <String, dynamic>{
  'keyEpoch': instance.keyEpoch,
  'operationId': instance.operationId,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt.toIso8601String(),
  'purgeAt': instance.purgeAt.toIso8601String(),
  'envelope': instance.envelope,
  'kind': _$TrashCollectionItemKindEnumMap[instance.kind]!,
};

const _$TrashCollectionItemKindEnumMap = {
  TrashCollectionItemKind.collection: 'collection',
  TrashCollectionItemKind.$unknown: r'$unknown',
};
