// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_collection_membership_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetCollectionMembershipOutput _$SetCollectionMembershipOutputFromJson(
  Map<String, dynamic> json,
) => SetCollectionMembershipOutput(
  collectionId: json['collectionId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  serverSequence: (json['serverSequence'] as num?)?.toInt(),
  editedAt: json['editedAt'] == null
      ? null
      : DateTime.parse(json['editedAt'] as String),
  recordIds: (json['recordIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  folderIds: (json['folderIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SetCollectionMembershipOutputToJson(
  SetCollectionMembershipOutput instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt?.toIso8601String(),
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
};
