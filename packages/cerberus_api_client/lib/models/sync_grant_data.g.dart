// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_grant_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncGrantData _$SyncGrantDataFromJson(Map<String, dynamic> json) =>
    SyncGrantData(
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

Map<String, dynamic> _$SyncGrantDataToJson(
  SyncGrantData instance,
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
