// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_collection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCollectionOutput _$DeleteCollectionOutputFromJson(
  Map<String, dynamic> json,
) => DeleteCollectionOutput(
  collectionId: json['collectionId'] as String?,
  trashOperationId: json['trashOperationId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  serverSequence: (json['serverSequence'] as num?)?.toInt(),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  purgeAt: json['purgeAt'] == null
      ? null
      : DateTime.parse(json['purgeAt'] as String),
);

Map<String, dynamic> _$DeleteCollectionOutputToJson(
  DeleteCollectionOutput instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'trashOperationId': instance.trashOperationId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
};
