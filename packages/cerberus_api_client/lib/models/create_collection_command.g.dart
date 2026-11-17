// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_collection_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCollectionCommand _$CreateCollectionCommandFromJson(
  Map<String, dynamic> json,
) => CreateCollectionCommand(
  collectionId: json['collectionId'] as String,
  envelope: EncryptedEnvelope.fromJson(
    json['envelope'] as Map<String, dynamic>,
  ),
  editedAt: DateTime.parse(json['editedAt'] as String),
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

Map<String, dynamic> _$CreateCollectionCommandToJson(
  CreateCollectionCommand instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
  'profileIds': instance.profileIds,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
