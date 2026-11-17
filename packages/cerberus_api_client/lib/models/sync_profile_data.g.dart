// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_profile_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncProfileData _$SyncProfileDataFromJson(Map<String, dynamic> json) =>
    SyncProfileData(
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

Map<String, dynamic> _$SyncProfileDataToJson(
  SyncProfileData instance,
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
