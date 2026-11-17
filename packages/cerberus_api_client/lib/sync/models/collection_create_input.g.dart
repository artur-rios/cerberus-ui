// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_create_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCreateInput _$CollectionCreateInputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'envelope',
      'editedAt',
      'profileIds',
      'recordIds',
      'folderIds',
    ],
    requiredKeys: const [
      'collectionId',
      'envelope',
      'editedAt',
      'profileIds',
      'recordIds',
      'folderIds',
    ],
    disallowNullValues: const ['collectionId', 'envelope', 'editedAt'],
  );
  return CollectionCreateInput(
    collectionId: json['collectionId'] as String,
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: CollectionCreateInput._read_editedAt(json['editedAt']),
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

Map<String, dynamic> _$CollectionCreateInputToJson(
  CollectionCreateInput instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'envelope': instance.envelope.toJson(),
  'editedAt': ?CollectionCreateInput._write_editedAt(instance.editedAt),
  'profileIds': instance.profileIds,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
