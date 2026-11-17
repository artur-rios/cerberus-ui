// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_replacement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentReplacement _$ContentReplacementFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'resourceKind',
      'resourceId',
      'expectedRevision',
      'envelope',
      'keyWrappers',
    ],
    disallowNullValues: const ['resourceId', 'expectedRevision', 'envelope'],
  );
  return ContentReplacement(
    resourceKind: json['resourceKind'] as String?,
    resourceId: json['resourceId'] as String?,
    expectedRevision: ContentReplacement._read_expectedRevision(
      json['expectedRevision'],
    ),
    envelope: json['envelope'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['envelope'] as Map<String, dynamic>),
    keyWrappers: json['keyWrappers'] == null
        ? null
        : ProfileKeyWrappers.fromJson(
            json['keyWrappers'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$ContentReplacementToJson(ContentReplacement instance) =>
    <String, dynamic>{
      'resourceKind': ?instance.resourceKind,
      'resourceId': ?instance.resourceId,
      'expectedRevision': ?ContentReplacement._write_expectedRevision(
        instance.expectedRevision,
      ),
      'envelope': ?instance.envelope?.toJson(),
      'keyWrappers': ?instance.keyWrappers?.toJson(),
    };
