// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_details_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionDetailsOutput _$CollectionDetailsOutputFromJson(
  Map<String, dynamic> json,
) => CollectionDetailsOutput(
  envelope: EncryptedEnvelope.fromJson(
    json['envelope'] as Map<String, dynamic>,
  ),
  collectionId: json['collectionId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  serverSequence: (json['serverSequence'] as num?)?.toInt(),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
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

Map<String, dynamic> _$CollectionDetailsOutputToJson(
  CollectionDetailsOutput instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt?.toIso8601String(),
  'envelope': instance.envelope,
  'profileIds': instance.profileIds,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
