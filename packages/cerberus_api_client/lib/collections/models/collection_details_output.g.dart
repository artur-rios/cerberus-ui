// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_details_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionDetailsOutput _$CollectionDetailsOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
      'profileIds',
      'recordIds',
      'folderIds',
    ],
    requiredKeys: const ['envelope'],
    disallowNullValues: const [
      'collectionId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
  );
  return CollectionDetailsOutput(
    collectionId: json['collectionId'] as String?,
    revision: CollectionDetailsOutput._read_revision(json['revision']),
    serverSequence: CollectionDetailsOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: CollectionDetailsOutput._read_editedAt(json['editedAt']),
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    profileIds: (json['profileIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    recordIds: (json['recordIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    folderIds: (json['folderIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$CollectionDetailsOutputToJson(
  CollectionDetailsOutput instance,
) => <String, dynamic>{
  'collectionId': ?instance.collectionId,
  'revision': ?CollectionDetailsOutput._write_revision(instance.revision),
  'serverSequence': ?CollectionDetailsOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?CollectionDetailsOutput._write_editedAt(instance.editedAt),
  'envelope': instance.envelope.toJson(),
  'profileIds': ?instance.profileIds,
  'recordIds': ?instance.recordIds,
  'folderIds': ?instance.folderIds,
};
