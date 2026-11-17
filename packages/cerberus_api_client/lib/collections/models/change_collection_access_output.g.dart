// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_collection_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeCollectionAccessOutput _$ChangeCollectionAccessOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'collectionId',
      'grantId',
      'revision',
      'access',
      'recordIds',
      'folderIds',
    ],
    disallowNullValues: const ['collectionId', 'grantId', 'revision'],
  );
  return ChangeCollectionAccessOutput(
    collectionId: json['collectionId'] as String?,
    grantId: json['grantId'] as String?,
    revision: ChangeCollectionAccessOutput._read_revision(json['revision']),
    access: json['access'] as String?,
    recordIds: (json['recordIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    folderIds: (json['folderIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$ChangeCollectionAccessOutputToJson(
  ChangeCollectionAccessOutput instance,
) => <String, dynamic>{
  'collectionId': ?instance.collectionId,
  'grantId': ?instance.grantId,
  'revision': ?ChangeCollectionAccessOutput._write_revision(instance.revision),
  'access': ?instance.access,
  'recordIds': ?instance.recordIds,
  'folderIds': ?instance.folderIds,
};
