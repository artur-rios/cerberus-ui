// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_grant_replacement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionGrantReplacement _$CollectionGrantReplacementFromJson(
  Map<String, dynamic> json,
) => CollectionGrantReplacement(
  grantId: json['grantId'] as String?,
  expectedRevision: (json['expectedRevision'] as num?)?.toInt(),
  keyEnvelope: json['keyEnvelope'] == null
      ? null
      : RecipientEnvelope.fromJson(json['keyEnvelope'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CollectionGrantReplacementToJson(
  CollectionGrantReplacement instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'expectedRevision': instance.expectedRevision,
  'keyEnvelope': instance.keyEnvelope,
};
