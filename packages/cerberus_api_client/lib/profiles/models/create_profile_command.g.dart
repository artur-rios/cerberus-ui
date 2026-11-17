// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_profile_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProfileCommand _$CreateProfileCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'profileId',
      'envelope',
      'keyWrappers',
      'editedAt',
      'recordIds',
      'folderIds',
      'collectionIds',
    ],
    disallowNullValues: const [
      'profileId',
      'envelope',
      'keyWrappers',
      'editedAt',
    ],
  );
  return CreateProfileCommand(
    profileId: json['profileId'] as String?,
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
    keyWrappers: json['keyWrappers'] == null
        ? null
        : ProfileKeyWrappers.fromJson(
            json['keyWrappers'] as Map<String, dynamic>,
          ),
    editedAt: CreateProfileCommand._read_editedAt(json['editedAt']),
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
}

Map<String, dynamic> _$CreateProfileCommandToJson(
  CreateProfileCommand instance,
) => <String, dynamic>{
  'profileId': ?instance.profileId,
  'envelope': ?instance.envelope?.toJson(),
  'keyWrappers': ?instance.keyWrappers?.toJson(),
  'editedAt': ?CreateProfileCommand._write_editedAt(instance.editedAt),
  'recordIds': ?instance.recordIds,
  'folderIds': ?instance.folderIds,
  'collectionIds': ?instance.collectionIds,
};
