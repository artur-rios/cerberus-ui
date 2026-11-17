// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_collection_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncCollectionData _$SyncCollectionDataFromJson(Map<String, dynamic> json) =>
    SyncCollectionData(
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

Map<String, dynamic> _$SyncCollectionDataToJson(SyncCollectionData instance) =>
    <String, dynamic>{
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
