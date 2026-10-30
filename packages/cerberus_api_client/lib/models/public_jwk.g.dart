// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_jwk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicJwk _$PublicJwkFromJson(Map<String, dynamic> json) => PublicJwk(
  crv: json['crv'] as String?,
  kty: json['kty'] as String?,
  x: json['x'] as String?,
  y: json['y'] as String?,
);

Map<String, dynamic> _$PublicJwkToJson(PublicJwk instance) => <String, dynamic>{
  'crv': instance.crv,
  'kty': instance.kty,
  'x': instance.x,
  'y': instance.y,
};
