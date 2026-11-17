// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_profile_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProfileOutput _$CreateProfileOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['profileId', 'revision', 'serverSequence', 'editedAt'],
    disallowNullValues: const [
      'profileId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
  );
  return CreateProfileOutput(
    profileId: json['profileId'] as String?,
    revision: CreateProfileOutput._read_revision(json['revision']),
    serverSequence: CreateProfileOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: CreateProfileOutput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$CreateProfileOutputToJson(
  CreateProfileOutput instance,
) => <String, dynamic>{
  'profileId': ?instance.profileId,
  'revision': ?CreateProfileOutput._write_revision(instance.revision),
  'serverSequence': ?CreateProfileOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?CreateProfileOutput._write_editedAt(instance.editedAt),
};
