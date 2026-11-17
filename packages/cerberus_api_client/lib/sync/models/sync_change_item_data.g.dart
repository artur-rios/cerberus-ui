// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_change_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncProfileData _$SyncProfileDataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'keyWrappers',
      'recordIds',
      'folderIds',
      'collectionIds',
      'resourceId',
      'revision',
      'resourceType',
    ],
    requiredKeys: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'keyWrappers',
      'recordIds',
      'folderIds',
      'collectionIds',
      'resourceId',
      'revision',
      'resourceType',
    ],
    disallowNullValues: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'keyWrappers',
      'resourceId',
      'revision',
      'resourceType',
    ],
  );
  return SyncProfileData(
    serverSequence: SyncProfileData._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: SyncProfileData._read_editedAt(json['editedAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    keyWrappers: ProfileKeyWrappers.fromJson(
      json['keyWrappers'] as Map<String, dynamic>,
    ),
    recordIds: (json['recordIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    folderIds: (json['folderIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    collectionIds: (json['collectionIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    resourceId: json['resourceId'] as String,
    revision: SyncProfileData._read_revision(json['revision']),
    resourceType: SyncProfileData._read_resourceType(json['resourceType']),
  );
}

Map<String, dynamic> _$SyncProfileDataToJson(
  SyncProfileData instance,
) => <String, dynamic>{
  'serverSequence': ?SyncProfileData._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?SyncProfileData._write_editedAt(instance.editedAt),
  'envelope': instance.envelope.toJson(),
  'keyWrappers': instance.keyWrappers.toJson(),
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
  'collectionIds': instance.collectionIds,
  'resourceId': instance.resourceId,
  'revision': ?SyncProfileData._write_revision(instance.revision),
  'resourceType': ?SyncProfileData._write_resourceType(instance.resourceType),
};

SyncRecordData _$SyncRecordDataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
    requiredKeys: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
    disallowNullValues: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
  );
  return SyncRecordData(
    serverSequence: SyncRecordData._read_serverSequence(json['serverSequence']),
    editedAt: SyncRecordData._read_editedAt(json['editedAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    resourceId: json['resourceId'] as String,
    revision: SyncRecordData._read_revision(json['revision']),
    resourceType: SyncRecordData._read_resourceType(json['resourceType']),
  );
}

Map<String, dynamic> _$SyncRecordDataToJson(
  SyncRecordData instance,
) => <String, dynamic>{
  'serverSequence': ?SyncRecordData._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?SyncRecordData._write_editedAt(instance.editedAt),
  'envelope': instance.envelope.toJson(),
  'resourceId': instance.resourceId,
  'revision': ?SyncRecordData._write_revision(instance.revision),
  'resourceType': ?SyncRecordData._write_resourceType(instance.resourceType),
};

SyncFolderData _$SyncFolderDataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
    requiredKeys: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
    disallowNullValues: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
  );
  return SyncFolderData(
    serverSequence: SyncFolderData._read_serverSequence(json['serverSequence']),
    editedAt: SyncFolderData._read_editedAt(json['editedAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    resourceId: json['resourceId'] as String,
    revision: SyncFolderData._read_revision(json['revision']),
    resourceType: SyncFolderData._read_resourceType(json['resourceType']),
  );
}

Map<String, dynamic> _$SyncFolderDataToJson(
  SyncFolderData instance,
) => <String, dynamic>{
  'serverSequence': ?SyncFolderData._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?SyncFolderData._write_editedAt(instance.editedAt),
  'envelope': instance.envelope.toJson(),
  'resourceId': instance.resourceId,
  'revision': ?SyncFolderData._write_revision(instance.revision),
  'resourceType': ?SyncFolderData._write_resourceType(instance.resourceType),
};

SyncCollectionData _$SyncCollectionDataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'keyEpoch',
      'resourceId',
      'revision',
      'resourceType',
    ],
    requiredKeys: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'keyEpoch',
      'resourceId',
      'revision',
      'resourceType',
    ],
    disallowNullValues: const [
      'serverSequence',
      'editedAt',
      'envelope',
      'keyEpoch',
      'resourceId',
      'revision',
      'resourceType',
    ],
  );
  return SyncCollectionData(
    serverSequence: SyncCollectionData._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: SyncCollectionData._read_editedAt(json['editedAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    keyEpoch: SyncCollectionData._read_keyEpoch(json['keyEpoch']),
    resourceId: json['resourceId'] as String,
    revision: SyncCollectionData._read_revision(json['revision']),
    resourceType: SyncCollectionData._read_resourceType(json['resourceType']),
  );
}

Map<String, dynamic> _$SyncCollectionDataToJson(SyncCollectionData instance) =>
    <String, dynamic>{
      'serverSequence': ?SyncCollectionData._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?SyncCollectionData._write_editedAt(instance.editedAt),
      'envelope': instance.envelope.toJson(),
      'keyEpoch': ?SyncCollectionData._write_keyEpoch(instance.keyEpoch),
      'resourceId': instance.resourceId,
      'revision': ?SyncCollectionData._write_revision(instance.revision),
      'resourceType': ?SyncCollectionData._write_resourceType(
        instance.resourceType,
      ),
    };

SyncGrantData _$SyncGrantDataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'recipientKeyEnvelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
    requiredKeys: const [
      'collectionId',
      'recipientKeyEnvelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
    disallowNullValues: const [
      'collectionId',
      'recipientKeyEnvelope',
      'resourceId',
      'revision',
      'resourceType',
    ],
  );
  return SyncGrantData(
    collectionId: json['collectionId'] as String,
    recipientKeyEnvelope: RecipientEnvelope.fromJson(
      json['recipientKeyEnvelope'] as Map<String, dynamic>,
    ),
    resourceId: json['resourceId'] as String,
    revision: SyncGrantData._read_revision(json['revision']),
    resourceType: SyncGrantData._read_resourceType(json['resourceType']),
  );
}

Map<String, dynamic> _$SyncGrantDataToJson(SyncGrantData instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'recipientKeyEnvelope': instance.recipientKeyEnvelope.toJson(),
      'resourceId': instance.resourceId,
      'revision': ?SyncGrantData._write_revision(instance.revision),
      'resourceType': ?SyncGrantData._write_resourceType(instance.resourceType),
    };
