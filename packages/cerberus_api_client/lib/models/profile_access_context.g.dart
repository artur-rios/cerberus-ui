// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_access_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileAccessContext _$ProfileAccessContextFromJson(
  Map<String, dynamic> json,
) => ProfileAccessContext(
  profileId: json['profileId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  serverSequence: (json['serverSequence'] as num?)?.toInt(),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
  envelope: json['envelope'] == null
      ? null
      : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
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

Map<String, dynamic> _$ProfileAccessContextToJson(
  ProfileAccessContext instance,
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
