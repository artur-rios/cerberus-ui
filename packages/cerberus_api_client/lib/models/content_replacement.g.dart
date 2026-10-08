// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_replacement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentReplacement _$ContentReplacementFromJson(Map<String, dynamic> json) =>
    ContentReplacement(
      resourceKind: json['resourceKind'] as String?,
      resourceId: json['resourceId'] as String?,
      expectedRevision: (json['expectedRevision'] as num?)?.toInt(),
      envelope: json['envelope'] == null
          ? null
          : EncryptedEnvelope.fromJson(
              json['envelope'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ContentReplacementToJson(ContentReplacement instance) =>
    <String, dynamic>{
      'resourceKind': instance.resourceKind,
      'resourceId': instance.resourceId,
      'expectedRevision': instance.expectedRevision,
      'envelope': instance.envelope,
    };
