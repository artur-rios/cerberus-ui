// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_collection_membership_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetCollectionMembershipOutput _$SetCollectionMembershipOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'revision',
      'serverSequence',
      'editedAt',
      'recordIds',
      'folderIds',
    ],
    disallowNullValues: const [
      'collectionId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
  );
  return SetCollectionMembershipOutput(
    collectionId: json['collectionId'] as String?,
    revision: SetCollectionMembershipOutput._read_revision(json['revision']),
    serverSequence: SetCollectionMembershipOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: SetCollectionMembershipOutput._read_editedAt(json['editedAt']),
    recordIds: (json['recordIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    folderIds: (json['folderIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$SetCollectionMembershipOutputToJson(
  SetCollectionMembershipOutput instance,
) => <String, dynamic>{
  'collectionId': ?instance.collectionId,
  'revision': ?SetCollectionMembershipOutput._write_revision(instance.revision),
  'serverSequence': ?SetCollectionMembershipOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?SetCollectionMembershipOutput._write_editedAt(instance.editedAt),
  'recordIds': ?instance.recordIds,
  'folderIds': ?instance.folderIds,
};
