// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_profile_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProfileOutput _$DeleteProfileOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'profileId',
      'trashOperationId',
      'revision',
      'serverSequence',
      'deletedAt',
      'purgeAt',
    ],
    disallowNullValues: const [
      'profileId',
      'trashOperationId',
      'revision',
      'serverSequence',
      'deletedAt',
      'purgeAt',
    ],
  );
  return DeleteProfileOutput(
    profileId: json['profileId'] as String?,
    trashOperationId: json['trashOperationId'] as String?,
    revision: DeleteProfileOutput._read_revision(json['revision']),
    serverSequence: DeleteProfileOutput._read_serverSequence(
      json['serverSequence'],
    ),
    deletedAt: DeleteProfileOutput._read_deletedAt(json['deletedAt']),
    purgeAt: DeleteProfileOutput._read_purgeAt(json['purgeAt']),
  );
}

Map<String, dynamic> _$DeleteProfileOutputToJson(
  DeleteProfileOutput instance,
) => <String, dynamic>{
  'profileId': ?instance.profileId,
  'trashOperationId': ?instance.trashOperationId,
  'revision': ?DeleteProfileOutput._write_revision(instance.revision),
  'serverSequence': ?DeleteProfileOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'deletedAt': ?DeleteProfileOutput._write_deletedAt(instance.deletedAt),
  'purgeAt': ?DeleteProfileOutput._write_purgeAt(instance.purgeAt),
};
