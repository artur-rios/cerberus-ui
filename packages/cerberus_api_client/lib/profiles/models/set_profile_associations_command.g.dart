// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_profile_associations_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetProfileAssociationsCommand _$SetProfileAssociationsCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'expectedRevision',
      'recordIds',
      'folderIds',
      'collectionIds',
    ],
    requiredKeys: const [
      'expectedRevision',
      'recordIds',
      'folderIds',
      'collectionIds',
    ],
    disallowNullValues: const ['expectedRevision'],
  );
  return SetProfileAssociationsCommand(
    expectedRevision: SetProfileAssociationsCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
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
}

Map<String, dynamic> _$SetProfileAssociationsCommandToJson(
  SetProfileAssociationsCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?SetProfileAssociationsCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'recordIds': instance.recordIds,
  'folderIds': instance.folderIds,
  'collectionIds': instance.collectionIds,
};
