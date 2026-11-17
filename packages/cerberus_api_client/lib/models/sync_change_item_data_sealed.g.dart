// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_change_item_data_sealed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$SyncChangeItemDataSealedToJson(
  SyncChangeItemDataSealed instance,
) => <String, dynamic>{};

SyncChangeItemDataSealedSyncProfileData
_$SyncChangeItemDataSealedSyncProfileDataFromJson(Map<String, dynamic> json) =>
    SyncChangeItemDataSealedSyncProfileData(
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
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
      revision: (json['revision'] as num).toInt(),
      resourceType: SyncProfileDataResourceType.fromJson(
        json['resourceType'] as String,
      ),
    );

Map<String, dynamic> _$SyncChangeItemDataSealedSyncProfileDataToJson(
  SyncChangeItemDataSealedSyncProfileData instance,
) => <String, dynamic>{
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'envelope': instance.envelope,
  'keyWrappers': instance.keyWrappers,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
  'collectionIds': instance.collectionIds,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'resourceType': _$SyncProfileDataResourceTypeEnumMap[instance.resourceType]!,
};

const _$SyncProfileDataResourceTypeEnumMap = {
  SyncProfileDataResourceType.profile: 'profile',
  SyncProfileDataResourceType.$unknown: r'$unknown',
};

SyncChangeItemDataSealedSyncRecordData
_$SyncChangeItemDataSealedSyncRecordDataFromJson(Map<String, dynamic> json) =>
    SyncChangeItemDataSealedSyncRecordData(
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      resourceType: SyncRecordDataResourceType.fromJson(
        json['resourceType'] as String,
      ),
    );

Map<String, dynamic> _$SyncChangeItemDataSealedSyncRecordDataToJson(
  SyncChangeItemDataSealedSyncRecordData instance,
) => <String, dynamic>{
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'envelope': instance.envelope,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'resourceType': _$SyncRecordDataResourceTypeEnumMap[instance.resourceType]!,
};

const _$SyncRecordDataResourceTypeEnumMap = {
  SyncRecordDataResourceType.record: 'record',
  SyncRecordDataResourceType.$unknown: r'$unknown',
};

SyncChangeItemDataSealedSyncFolderData
_$SyncChangeItemDataSealedSyncFolderDataFromJson(Map<String, dynamic> json) =>
    SyncChangeItemDataSealedSyncFolderData(
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
      envelope: EncryptedEnvelope.fromJson(
        json['envelope'] as Map<String, dynamic>,
      ),
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      resourceType: SyncFolderDataResourceType.fromJson(
        json['resourceType'] as String,
      ),
    );

Map<String, dynamic> _$SyncChangeItemDataSealedSyncFolderDataToJson(
  SyncChangeItemDataSealedSyncFolderData instance,
) => <String, dynamic>{
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'envelope': instance.envelope,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'resourceType': _$SyncFolderDataResourceTypeEnumMap[instance.resourceType]!,
};

const _$SyncFolderDataResourceTypeEnumMap = {
  SyncFolderDataResourceType.folder: 'folder',
  SyncFolderDataResourceType.$unknown: r'$unknown',
};

SyncChangeItemDataSealedSyncCollectionData
_$SyncChangeItemDataSealedSyncCollectionDataFromJson(
  Map<String, dynamic> json,
) => SyncChangeItemDataSealedSyncCollectionData(
  serverSequence: (json['serverSequence'] as num).toInt(),
  editedAt: DateTime.parse(json['editedAt'] as String),
  envelope: EncryptedEnvelope.fromJson(
    json['envelope'] as Map<String, dynamic>,
  ),
  keyEpoch: (json['keyEpoch'] as num).toInt(),
  resourceId: json['resourceId'] as String,
  revision: (json['revision'] as num).toInt(),
  resourceType: SyncCollectionDataResourceType.fromJson(
    json['resourceType'] as String,
  ),
);

Map<String, dynamic> _$SyncChangeItemDataSealedSyncCollectionDataToJson(
  SyncChangeItemDataSealedSyncCollectionData instance,
) => <String, dynamic>{
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'envelope': instance.envelope,
  'keyEpoch': instance.keyEpoch,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'resourceType':
      _$SyncCollectionDataResourceTypeEnumMap[instance.resourceType]!,
};

const _$SyncCollectionDataResourceTypeEnumMap = {
  SyncCollectionDataResourceType.collection: 'collection',
  SyncCollectionDataResourceType.$unknown: r'$unknown',
};

SyncChangeItemDataSealedSyncGrantData
_$SyncChangeItemDataSealedSyncGrantDataFromJson(Map<String, dynamic> json) =>
    SyncChangeItemDataSealedSyncGrantData(
      collectionId: json['collectionId'] as String,
      recipientKeyEnvelope: RecipientEnvelope.fromJson(
        json['recipientKeyEnvelope'] as Map<String, dynamic>,
      ),
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      resourceType: SyncGrantDataResourceType.fromJson(
        json['resourceType'] as String,
      ),
    );

Map<String, dynamic> _$SyncChangeItemDataSealedSyncGrantDataToJson(
  SyncChangeItemDataSealedSyncGrantData instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'recipientKeyEnvelope': instance.recipientKeyEnvelope,
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'resourceType': _$SyncGrantDataResourceTypeEnumMap[instance.resourceType]!,
};

const _$SyncGrantDataResourceTypeEnumMap = {
  SyncGrantDataResourceType.grant: 'grant',
  SyncGrantDataResourceType.$unknown: r'$unknown',
};
