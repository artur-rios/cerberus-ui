// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_list_output_items_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashCollectionItem _$TrashCollectionItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'keyEpoch',
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
    requiredKeys: const [
      'keyEpoch',
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
    disallowNullValues: const [
      'keyEpoch',
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
  );
  return TrashCollectionItem(
    keyEpoch: TrashCollectionItem._read_keyEpoch(json['keyEpoch']),
    operationId: json['operationId'] as String,
    resourceId: json['resourceId'] as String,
    revision: TrashCollectionItem._read_revision(json['revision']),
    serverSequence: TrashCollectionItem._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: TrashCollectionItem._read_editedAt(json['editedAt']),
    deletedAt: TrashCollectionItem._read_deletedAt(json['deletedAt']),
    purgeAt: TrashCollectionItem._read_purgeAt(json['purgeAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    kind: TrashCollectionItem._read_kind(json['kind']),
  );
}

Map<String, dynamic> _$TrashCollectionItemToJson(
  TrashCollectionItem instance,
) => <String, dynamic>{
  'keyEpoch': ?TrashCollectionItem._write_keyEpoch(instance.keyEpoch),
  'operationId': instance.operationId,
  'resourceId': instance.resourceId,
  'revision': ?TrashCollectionItem._write_revision(instance.revision),
  'serverSequence': ?TrashCollectionItem._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?TrashCollectionItem._write_editedAt(instance.editedAt),
  'deletedAt': ?TrashCollectionItem._write_deletedAt(instance.deletedAt),
  'purgeAt': ?TrashCollectionItem._write_purgeAt(instance.purgeAt),
  'envelope': instance.envelope.toJson(),
  'kind': ?TrashCollectionItem._write_kind(instance.kind),
};

TrashFolderItem _$TrashFolderItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
    requiredKeys: const [
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
    disallowNullValues: const [
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
  );
  return TrashFolderItem(
    operationId: json['operationId'] as String,
    resourceId: json['resourceId'] as String,
    revision: TrashFolderItem._read_revision(json['revision']),
    serverSequence: TrashFolderItem._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: TrashFolderItem._read_editedAt(json['editedAt']),
    deletedAt: TrashFolderItem._read_deletedAt(json['deletedAt']),
    purgeAt: TrashFolderItem._read_purgeAt(json['purgeAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    kind: TrashFolderItem._read_kind(json['kind']),
  );
}

Map<String, dynamic> _$TrashFolderItemToJson(TrashFolderItem instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'resourceId': instance.resourceId,
      'revision': ?TrashFolderItem._write_revision(instance.revision),
      'serverSequence': ?TrashFolderItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?TrashFolderItem._write_editedAt(instance.editedAt),
      'deletedAt': ?TrashFolderItem._write_deletedAt(instance.deletedAt),
      'purgeAt': ?TrashFolderItem._write_purgeAt(instance.purgeAt),
      'envelope': instance.envelope.toJson(),
      'kind': ?TrashFolderItem._write_kind(instance.kind),
    };

TrashRecordItem _$TrashRecordItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
    requiredKeys: const [
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
    disallowNullValues: const [
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
  );
  return TrashRecordItem(
    operationId: json['operationId'] as String,
    resourceId: json['resourceId'] as String,
    revision: TrashRecordItem._read_revision(json['revision']),
    serverSequence: TrashRecordItem._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: TrashRecordItem._read_editedAt(json['editedAt']),
    deletedAt: TrashRecordItem._read_deletedAt(json['deletedAt']),
    purgeAt: TrashRecordItem._read_purgeAt(json['purgeAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    kind: TrashRecordItem._read_kind(json['kind']),
  );
}

Map<String, dynamic> _$TrashRecordItemToJson(TrashRecordItem instance) =>
    <String, dynamic>{
      'operationId': instance.operationId,
      'resourceId': instance.resourceId,
      'revision': ?TrashRecordItem._write_revision(instance.revision),
      'serverSequence': ?TrashRecordItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?TrashRecordItem._write_editedAt(instance.editedAt),
      'deletedAt': ?TrashRecordItem._write_deletedAt(instance.deletedAt),
      'purgeAt': ?TrashRecordItem._write_purgeAt(instance.purgeAt),
      'envelope': instance.envelope.toJson(),
      'kind': ?TrashRecordItem._write_kind(instance.kind),
    };

TrashProfileItem _$TrashProfileItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'keyWrappers',
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
    requiredKeys: const [
      'keyWrappers',
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
    disallowNullValues: const [
      'keyWrappers',
      'operationId',
      'resourceId',
      'revision',
      'serverSequence',
      'editedAt',
      'deletedAt',
      'purgeAt',
      'envelope',
      'kind',
    ],
  );
  return TrashProfileItem(
    keyWrappers: ProfileKeyWrappers.fromJson(
      json['keyWrappers'] as Map<String, dynamic>,
    ),
    operationId: json['operationId'] as String,
    resourceId: json['resourceId'] as String,
    revision: TrashProfileItem._read_revision(json['revision']),
    serverSequence: TrashProfileItem._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: TrashProfileItem._read_editedAt(json['editedAt']),
    deletedAt: TrashProfileItem._read_deletedAt(json['deletedAt']),
    purgeAt: TrashProfileItem._read_purgeAt(json['purgeAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    kind: TrashProfileItem._read_kind(json['kind']),
  );
}

Map<String, dynamic> _$TrashProfileItemToJson(TrashProfileItem instance) =>
    <String, dynamic>{
      'keyWrappers': instance.keyWrappers.toJson(),
      'operationId': instance.operationId,
      'resourceId': instance.resourceId,
      'revision': ?TrashProfileItem._write_revision(instance.revision),
      'serverSequence': ?TrashProfileItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?TrashProfileItem._write_editedAt(instance.editedAt),
      'deletedAt': ?TrashProfileItem._write_deletedAt(instance.deletedAt),
      'purgeAt': ?TrashProfileItem._write_purgeAt(instance.purgeAt),
      'envelope': instance.envelope.toJson(),
      'kind': ?TrashProfileItem._write_kind(instance.kind),
    };
