// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_collection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCollectionOutput _$UpdateCollectionOutputFromJson(
  Map<String, dynamic> json,
) => UpdateCollectionOutput(
  collectionId: json['collectionId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  serverSequence: (json['serverSequence'] as num?)?.toInt(),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
);

Map<String, dynamic> _$UpdateCollectionOutputToJson(
  UpdateCollectionOutput instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt?.toIso8601String(),
};
