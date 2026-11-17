// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_profile_associations_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetProfileAssociationsOutput _$SetProfileAssociationsOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'profileId',
      'revision',
      'serverSequence',
      'recordIds',
      'folderIds',
      'collectionIds',
    ],
    disallowNullValues: const ['profileId', 'revision', 'serverSequence'],
  );
  return SetProfileAssociationsOutput(
    profileId: json['profileId'] as String?,
    revision: SetProfileAssociationsOutput._read_revision(json['revision']),
    serverSequence: SetProfileAssociationsOutput._read_serverSequence(
      json['serverSequence'],
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

Map<String, dynamic> _$SetProfileAssociationsOutputToJson(
  SetProfileAssociationsOutput instance,
) => <String, dynamic>{
  'profileId': ?instance.profileId,
  'revision': ?SetProfileAssociationsOutput._write_revision(instance.revision),
  'serverSequence': ?SetProfileAssociationsOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'recordIds': ?instance.recordIds,
  'folderIds': ?instance.folderIds,
  'collectionIds': ?instance.collectionIds,
};
