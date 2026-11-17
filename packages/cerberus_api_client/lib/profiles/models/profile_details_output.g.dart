// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetailsOutput _$ProfileDetailsOutputFromJson(Map<String, dynamic> json) {
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
    requiredKeys: const ['envelope', 'keyWrappers'],
    disallowNullValues: const [
      'profileId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
      'keyWrappers',
    ],
  );
  return ProfileDetailsOutput(
    profileId: json['profileId'] as String?,
    revision: ProfileDetailsOutput._read_revision(json['revision']),
    serverSequence: ProfileDetailsOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: ProfileDetailsOutput._read_editedAt(json['editedAt']),
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
  );
}

Map<String, dynamic> _$ProfileDetailsOutputToJson(
  ProfileDetailsOutput instance,
) => <String, dynamic>{
  'profileId': ?instance.profileId,
  'revision': ?ProfileDetailsOutput._write_revision(instance.revision),
  'serverSequence': ?ProfileDetailsOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?ProfileDetailsOutput._write_editedAt(instance.editedAt),
  'envelope': instance.envelope.toJson(),
  'keyWrappers': instance.keyWrappers.toJson(),
  'recordIds': ?instance.recordIds,
  'folderIds': ?instance.folderIds,
  'collectionIds': ?instance.collectionIds,
};
