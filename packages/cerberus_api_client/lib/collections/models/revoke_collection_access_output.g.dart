// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_collection_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeCollectionAccessOutput _$RevokeCollectionAccessOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['collectionId', 'grantId', 'revision'],
    disallowNullValues: const ['collectionId', 'grantId', 'revision'],
  );
  return RevokeCollectionAccessOutput(
    collectionId: json['collectionId'] as String?,
    grantId: json['grantId'] as String?,
    revision: RevokeCollectionAccessOutput._read_revision(json['revision']),
  );
}

Map<String, dynamic> _$RevokeCollectionAccessOutputToJson(
  RevokeCollectionAccessOutput instance,
) => <String, dynamic>{
  'collectionId': ?instance.collectionId,
  'grantId': ?instance.grantId,
  'revision': ?RevokeCollectionAccessOutput._write_revision(instance.revision),
};
