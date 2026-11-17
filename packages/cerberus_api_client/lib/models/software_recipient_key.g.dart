// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_recipient_key.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareRecipientKey _$SoftwareRecipientKeyFromJson(
  Map<String, dynamic> json,
) => SoftwareRecipientKey(
  crv: json['crv'] as String?,
  kty: json['kty'] as String?,
  x: json['x'] as String?,
  y: json['y'] as String?,
);

Map<String, dynamic> _$SoftwareRecipientKeyToJson(
  SoftwareRecipientKey instance,
) => <String, dynamic>{
  'crv': instance.crv,
  'kty': instance.kty,
  'x': instance.x,
  'y': instance.y,
};
