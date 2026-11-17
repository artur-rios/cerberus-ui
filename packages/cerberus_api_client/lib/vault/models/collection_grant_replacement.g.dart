// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_grant_replacement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionGrantReplacement _$CollectionGrantReplacementFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['grantId', 'expectedRevision', 'keyEnvelope'],
    disallowNullValues: const ['grantId', 'expectedRevision', 'keyEnvelope'],
  );
  return CollectionGrantReplacement(
    grantId: json['grantId'] as String?,
    expectedRevision: CollectionGrantReplacement._read_expectedRevision(
      json['expectedRevision'],
    ),
    keyEnvelope: json['keyEnvelope'] == null
        ? null
        : RecipientEnvelope.fromJson(
            json['keyEnvelope'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$CollectionGrantReplacementToJson(
  CollectionGrantReplacement instance,
) => <String, dynamic>{
  'grantId': ?instance.grantId,
  'expectedRevision': ?CollectionGrantReplacement._write_expectedRevision(
    instance.expectedRevision,
  ),
  'keyEnvelope': ?instance.keyEnvelope?.toJson(),
};
