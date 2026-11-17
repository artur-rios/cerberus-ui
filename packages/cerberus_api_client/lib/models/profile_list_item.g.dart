// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileListItem _$ProfileListItemFromJson(Map<String, dynamic> json) =>
    ProfileListItem(
      profileId: json['profileId'] as String?,
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
      keyWrappers: json['keyWrappers'] == null
          ? null
          : ProfileKeyWrappers.fromJson(
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
    );

Map<String, dynamic> _$ProfileListItemToJson(ProfileListItem instance) =>
    <String, dynamic>{
      'profileId': instance.profileId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt?.toIso8601String(),
      'envelope': instance.envelope,
      'keyWrappers': instance.keyWrappers,
      'recordIds': instance.recordIds,
      'folderIds': instance.folderIds,
      'collectionIds': instance.collectionIds,
    };
