// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_create_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionCreateInput _$CollectionCreateInputFromJson(
  Map<String, dynamic> json,
) => CollectionCreateInput(
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

Map<String, dynamic> _$CollectionCreateInputToJson(
  CollectionCreateInput instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'envelope': instance.envelope,
  'editedAt': instance.editedAt.toIso8601String(),
  'profileIds': instance.profileIds,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
