// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_collection_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeCollectionAccessOutput _$ChangeCollectionAccessOutputFromJson(
  Map<String, dynamic> json,
) => ChangeCollectionAccessOutput(
  collectionId: json['collectionId'] as String?,
  grantId: json['grantId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  access: json['access'] as String?,
  recordIds: (json['recordIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  folderIds: (json['folderIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ChangeCollectionAccessOutputToJson(
  ChangeCollectionAccessOutput instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'grantId': instance.grantId,
  'revision': instance.revision,
  'access': instance.access,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
