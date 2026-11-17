// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCollectionOutput _$CreateCollectionOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
    disallowNullValues: const [
      'collectionId',
      'revision',
      'serverSequence',
      'editedAt',
    ],
  );
  return CreateCollectionOutput(
    collectionId: json['collectionId'] as String?,
    revision: CreateCollectionOutput._read_revision(json['revision']),
    serverSequence: CreateCollectionOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: CreateCollectionOutput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$CreateCollectionOutputToJson(
  CreateCollectionOutput instance,
) => <String, dynamic>{
  'collectionId': ?instance.collectionId,
  'revision': ?CreateCollectionOutput._write_revision(instance.revision),
  'serverSequence': ?CreateCollectionOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?CreateCollectionOutput._write_editedAt(instance.editedAt),
};
