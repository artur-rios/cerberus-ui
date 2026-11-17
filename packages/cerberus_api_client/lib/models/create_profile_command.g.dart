// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_profile_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProfileCommand _$CreateProfileCommandFromJson(
  Map<String, dynamic> json,
) => CreateProfileCommand(
  profileId: json['profileId'] as String?,
  envelope: json['envelope'] == null
      ? null
      : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
  keyWrappers: json['keyWrappers'] == null
      ? null
      : ProfileKeyWrappers.fromJson(
          json['keyWrappers'] as Map<String, dynamic>,
        ),
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

Map<String, dynamic> _$CreateProfileCommandToJson(
  CreateProfileCommand instance,
) => <String, dynamic>{
  'profileId': instance.profileId,
  'envelope': instance.envelope,
  'keyWrappers': instance.keyWrappers,
  'editedAt': instance.editedAt?.toIso8601String(),
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
  'collectionIds': instance.collectionIds,
};
