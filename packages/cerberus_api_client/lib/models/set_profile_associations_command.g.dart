// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_profile_associations_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetProfileAssociationsCommand _$SetProfileAssociationsCommandFromJson(
  Map<String, dynamic> json,
) => SetProfileAssociationsCommand(
  expectedRevision: (json['expectedRevision'] as num).toInt(),
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

Map<String, dynamic> _$SetProfileAssociationsCommandToJson(
  SetProfileAssociationsCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
  'collectionIds': instance.collectionIds,
};
