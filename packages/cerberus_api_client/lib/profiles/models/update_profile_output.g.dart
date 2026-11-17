// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileOutput _$UpdateProfileOutputFromJson(Map<String, dynamic> json) {
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
  return UpdateProfileOutput(
    profileId: json['profileId'] as String?,
    revision: UpdateProfileOutput._read_revision(json['revision']),
    serverSequence: UpdateProfileOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: UpdateProfileOutput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$UpdateProfileOutputToJson(
  UpdateProfileOutput instance,
) => <String, dynamic>{
  'profileId': ?instance.profileId,
  'revision': ?UpdateProfileOutput._write_revision(instance.revision),
  'serverSequence': ?UpdateProfileOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?UpdateProfileOutput._write_editedAt(instance.editedAt),
};
