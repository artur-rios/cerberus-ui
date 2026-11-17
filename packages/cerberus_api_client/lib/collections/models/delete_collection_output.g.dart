// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_collection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCollectionOutput _$DeleteCollectionOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'trashOperationId',
      'revision',
      'serverSequence',
      'deletedAt',
      'purgeAt',
    ],
    disallowNullValues: const [
      'collectionId',
      'trashOperationId',
      'revision',
      'serverSequence',
      'deletedAt',
      'purgeAt',
    ],
  );
  return DeleteCollectionOutput(
    collectionId: json['collectionId'] as String?,
    trashOperationId: json['trashOperationId'] as String?,
    revision: DeleteCollectionOutput._read_revision(json['revision']),
    serverSequence: DeleteCollectionOutput._read_serverSequence(
      json['serverSequence'],
    ),
    deletedAt: DeleteCollectionOutput._read_deletedAt(json['deletedAt']),
    purgeAt: DeleteCollectionOutput._read_purgeAt(json['purgeAt']),
  );
}

Map<String, dynamic> _$DeleteCollectionOutputToJson(
  DeleteCollectionOutput instance,
) => <String, dynamic>{
  'collectionId': ?instance.collectionId,
  'trashOperationId': ?instance.trashOperationId,
  'revision': ?DeleteCollectionOutput._write_revision(instance.revision),
  'serverSequence': ?DeleteCollectionOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'deletedAt': ?DeleteCollectionOutput._write_deletedAt(instance.deletedAt),
  'purgeAt': ?DeleteCollectionOutput._write_purgeAt(instance.purgeAt),
};
