// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_collection_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrantCollectionAccessOutput _$GrantCollectionAccessOutputFromJson(
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
  return GrantCollectionAccessOutput(
    collectionId: json['collectionId'] as String?,
    grantId: json['grantId'] as String?,
    revision: GrantCollectionAccessOutput._read_revision(json['revision']),
    access: json['access'] as String?,
    recordIds: (json['recordIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    folderIds: (json['folderIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$GrantCollectionAccessOutputToJson(
  GrantCollectionAccessOutput instance,
) => <String, dynamic>{
  'collectionId': ?instance.collectionId,
  'grantId': ?instance.grantId,
  'revision': ?GrantCollectionAccessOutput._write_revision(instance.revision),
  'access': ?instance.access,
  'recordIds': ?instance.recordIds,
  'folderIds': ?instance.folderIds,
};
