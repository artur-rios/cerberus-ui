// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionListItem _$CollectionListItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
    disallowNullValues: const [
      'collectionId',
      'revision',
      'serverSequence',
      'editedAt',
      'envelope',
    ],
  );
  return CollectionListItem(
    collectionId: json['collectionId'] as String?,
    revision: CollectionListItem._read_revision(json['revision']),
    serverSequence: CollectionListItem._read_serverSequence(
      json['serverSequence'],
    ),
    editedAt: CollectionListItem._read_editedAt(json['editedAt']),
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectionListItemToJson(CollectionListItem instance) =>
    <String, dynamic>{
      'collectionId': ?instance.collectionId,
      'revision': ?CollectionListItem._write_revision(instance.revision),
      'serverSequence': ?CollectionListItem._write_serverSequence(
        instance.serverSequence,
      ),
      'editedAt': ?CollectionListItem._write_editedAt(instance.editedAt),
      'envelope': ?instance.envelope?.toJson(),
    };
