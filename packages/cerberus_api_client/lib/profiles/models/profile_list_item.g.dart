// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileListItem _$ProfileListItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'profileId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
      'keyWrappers',
      'recordIds',
      'folderIds',
      'collectionIds',
    ],
    disallowNullValues: const [
      'profileId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
      'keyWrappers',
    ],
  );
  return ProfileListItem(
    profileId: json['profileId'] as String?,
    revision: ProfileListItem._read_revision(json['revision']),
    serverSequence: ProfileListItem._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: ProfileListItem._read_editedAt(json['editedAt']),
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
}

Map<String, dynamic> _$ProfileListItemToJson(ProfileListItem instance) =>
    <String, dynamic>{
      'profileId': ?instance.profileId,
      'revision': ?ProfileListItem._write_revision(instance.revision),
      'serverSequence': ?ProfileListItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?ProfileListItem._write_editedAt(instance.editedAt),
      'envelope': ?instance.envelope?.toJson(),
      'keyWrappers': ?instance.keyWrappers?.toJson(),
      'recordIds': ?instance.recordIds,
      'folderIds': ?instance.folderIds,
      'collectionIds': ?instance.collectionIds,
    };
