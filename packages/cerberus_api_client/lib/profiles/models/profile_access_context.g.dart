// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_access_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileAccessContext _$ProfileAccessContextFromJson(Map<String, dynamic> json) {
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
  return ProfileAccessContext(
    profileId: json['profileId'] as String?,
    revision: ProfileAccessContext._read_revision(json['revision']),
    serverSequence: ProfileAccessContext._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: ProfileAccessContext._read_editedAt(json['editedAt']),
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

Map<String, dynamic> _$ProfileAccessContextToJson(
  ProfileAccessContext instance,
) => <String, dynamic>{
  'profileId': ?instance.profileId,
  'revision': ?ProfileAccessContext._write_revision(instance.revision),
  'serverSequence': ?ProfileAccessContext._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?ProfileAccessContext._write_editedAt(instance.editedAt),
  'envelope': ?instance.envelope?.toJson(),
  'keyWrappers': ?instance.keyWrappers?.toJson(),
  'recordIds': ?instance.recordIds,
  'folderIds': ?instance.folderIds,
  'collectionIds': ?instance.collectionIds,
};
