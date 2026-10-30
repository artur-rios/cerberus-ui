// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'public_jwk.g.dart';

@JsonSerializable()
class PublicJwk {
  const PublicJwk({this.crv, this.kty, this.x, this.y});

  factory PublicJwk.fromJson(Map<String, Object?> json) =>
      _$PublicJwkFromJson(json);

  final String? crv;
  final String? kty;
  final String? x;
  final String? y;

  Map<String, Object?> toJson() => _$PublicJwkToJson(this);
}
