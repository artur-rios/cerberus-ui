// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCollectionOutput _$UpdateCollectionOutputFromJson(
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
  return UpdateCollectionOutput(
    collectionId: json['collectionId'] as String?,
    revision: UpdateCollectionOutput._read_revision(json['revision']),
    serverSequence: UpdateCollectionOutput._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: UpdateCollectionOutput._read_editedAt(json['editedAt']),
  );
}

Map<String, dynamic> _$UpdateCollectionOutputToJson(
  UpdateCollectionOutput instance,
) => <String, dynamic>{
  'collectionId': ?instance.collectionId,
  'revision': ?UpdateCollectionOutput._write_revision(instance.revision),
  'serverSequence': ?UpdateCollectionOutput._write_serverSequence(
    instance.serverSequence,
  ),
  'editedAt': ?UpdateCollectionOutput._write_editedAt(instance.editedAt),
};
