// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_profile_associations_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetProfileAssociationsOutput _$SetProfileAssociationsOutputFromJson(
  Map<String, dynamic> json,
) => SetProfileAssociationsOutput(
  profileId: json['profileId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
  serverSequence: (json['serverSequence'] as num?)?.toInt(),
  recordIds: (json['recordIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  folderIds: (json['folderIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  collectionIds: (json['collectionIds'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$SetProfileAssociationsOutputToJson(
  SetProfileAssociationsOutput instance,
) => <String, dynamic>{
  'profileId': instance.profileId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
  'collectionIds': instance.collectionIds,
};
