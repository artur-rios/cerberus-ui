// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_list_output_items_sealed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TrashListOutputItemsSealedToJson(
  TrashListOutputItemsSealed instance,
) => <String, dynamic>{};

TrashListOutputItemsSealedTrashRecordItem
_$TrashListOutputItemsSealedTrashRecordItemFromJson(
  Map<String, dynamic> json,
) => TrashListOutputItemsSealedTrashRecordItem(
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
  kind: TrashRecordItemKind.fromJson(json['kind'] as String),
);

Map<String, dynamic> _$TrashListOutputItemsSealedTrashRecordItemToJson(
  TrashListOutputItemsSealedTrashRecordItem instance,
) => <String, dynamic>{
  'operationId': instance.operationId,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt.toIso8601String(),
  'purgeAt': instance.purgeAt.toIso8601String(),
  'envelope': instance.envelope,
  'kind': _$TrashRecordItemKindEnumMap[instance.kind]!,
};

const _$TrashRecordItemKindEnumMap = {
  TrashRecordItemKind.record: 'record',
  TrashRecordItemKind.$unknown: r'$unknown',
};

TrashListOutputItemsSealedTrashFolderItem
_$TrashListOutputItemsSealedTrashFolderItemFromJson(
  Map<String, dynamic> json,
) => TrashListOutputItemsSealedTrashFolderItem(
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

Map<String, dynamic> _$TrashListOutputItemsSealedTrashFolderItemToJson(
  TrashListOutputItemsSealedTrashFolderItem instance,
) => <String, dynamic>{
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

TrashListOutputItemsSealedTrashCollectionItem
_$TrashListOutputItemsSealedTrashCollectionItemFromJson(
  Map<String, dynamic> json,
) => TrashListOutputItemsSealedTrashCollectionItem(
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

Map<String, dynamic> _$TrashListOutputItemsSealedTrashCollectionItemToJson(
  TrashListOutputItemsSealedTrashCollectionItem instance,
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

TrashListOutputItemsSealedTrashProfileItem
_$TrashListOutputItemsSealedTrashProfileItemFromJson(
  Map<String, dynamic> json,
) => TrashListOutputItemsSealedTrashProfileItem(
  keyWrappers: ProfileKeyWrappers.fromJson(
    json['keyWrappers'] as Map<String, dynamic>,
  ),
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
  kind: TrashProfileItemKind.fromJson(json['kind'] as String),
);

Map<String, dynamic> _$TrashListOutputItemsSealedTrashProfileItemToJson(
  TrashListOutputItemsSealedTrashProfileItem instance,
) => <String, dynamic>{
  'keyWrappers': instance.keyWrappers,
  'operationId': instance.operationId,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt.toIso8601String(),
  'purgeAt': instance.purgeAt.toIso8601String(),
  'envelope': instance.envelope,
  'kind': _$TrashProfileItemKindEnumMap[instance.kind]!,
};

const _$TrashProfileItemKindEnumMap = {
  TrashProfileItemKind.profile: 'profile',
  TrashProfileItemKind.$unknown: r'$unknown',
};
