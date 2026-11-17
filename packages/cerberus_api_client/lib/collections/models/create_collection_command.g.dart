// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collection_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCollectionCommand _$CreateCollectionCommandFromJson(
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
  return CreateCollectionCommand(
    collectionId: json['collectionId'] as String,
    envelope: EncryptedEnvelope.fromJson(
      json['envelope'] as Map<String, dynamic>,
    ),
    editedAt: CreateCollectionCommand._read_editedAt(json['editedAt']),
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

Map<String, dynamic> _$CreateCollectionCommandToJson(
  CreateCollectionCommand instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'envelope': instance.envelope.toJson(),
  'editedAt': ?CreateCollectionCommand._write_editedAt(instance.editedAt),
  'profileIds': instance.profileIds,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
