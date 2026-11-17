// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetailsOutput _$ProfileDetailsOutputFromJson(
  Map<String, dynamic> json,
) => ProfileDetailsOutput(
  envelope: EncryptedEnvelope.fromJson(
    json['envelope'] as Map<String, dynamic>,
  ),
  keyWrappers: ProfileKeyWrappers.fromJson(
    json['keyWrappers'] as Map<String, dynamic>,
  ),
  profileId: json['profileId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  serverSequence: (json['serverSequence'] as num?)?.toInt(),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
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

Map<String, dynamic> _$ProfileDetailsOutputToJson(
  ProfileDetailsOutput instance,
) => <String, dynamic>{
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
