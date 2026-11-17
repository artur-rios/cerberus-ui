// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'revoke_collection_access_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RevokeCollectionAccessOutput _$RevokeCollectionAccessOutputFromJson(
  Map<String, dynamic> json,
) => RevokeCollectionAccessOutput(
  collectionId: json['collectionId'] as String?,
  grantId: json['grantId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$RevokeCollectionAccessOutputToJson(
  RevokeCollectionAccessOutput instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'grantId': instance.grantId,
  'revision': instance.revision,
};
