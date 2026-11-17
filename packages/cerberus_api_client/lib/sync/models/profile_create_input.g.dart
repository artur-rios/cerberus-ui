// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_create_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileCreateInput _$ProfileCreateInputFromJson(Map<String, dynamic> json) {
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
  return ProfileCreateInput(
    profileId: json['profileId'] as String?,
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
    keyWrappers: json['keyWrappers'] == null
        ? null
        : ProfileKeyWrappers.fromJson(
            json['keyWrappers'] as Map<String, dynamic>,
          ),
    editedAt: ProfileCreateInput._read_editedAt(json['editedAt']),
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

Map<String, dynamic> _$ProfileCreateInputToJson(ProfileCreateInput instance) =>
    <String, dynamic>{
      'profileId': ?instance.profileId,
      'envelope': ?instance.envelope?.toJson(),
      'keyWrappers': ?instance.keyWrappers?.toJson(),
      'editedAt': ?ProfileCreateInput._write_editedAt(instance.editedAt),
      'recordIds': ?instance.recordIds,
      'folderIds': ?instance.folderIds,
      'collectionIds': ?instance.collectionIds,
    };
