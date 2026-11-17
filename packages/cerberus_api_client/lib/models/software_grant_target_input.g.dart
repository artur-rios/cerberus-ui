// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_grant_target_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareGrantTargetInput _$SoftwareGrantTargetInputFromJson(
  Map<String, dynamic> json,
) => SoftwareGrantTargetInput(
  kind: json['kind'] as String?,
  id: json['id'] as String,
  keyEnvelope: RecipientEnvelope.fromJson(
    json['keyEnvelope'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$SoftwareGrantTargetInputToJson(
  SoftwareGrantTargetInput instance,
) => <String, dynamic>{
  'kind': instance.kind,
  'id': instance.id,
  'keyEnvelope': instance.keyEnvelope,
};
