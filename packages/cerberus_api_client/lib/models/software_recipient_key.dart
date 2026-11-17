// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'software_recipient_key.g.dart';

@JsonSerializable()
class SoftwareRecipientKey {
  const SoftwareRecipientKey({
    required this.crv,
    required this.kty,
    required this.x,
    required this.y,
  });

  factory SoftwareRecipientKey.fromJson(Map<String, Object?> json) =>
      _$SoftwareRecipientKeyFromJson(json);

  final String? crv;
  final String? kty;
  final String? x;
  final String? y;

  Map<String, Object?> toJson() => _$SoftwareRecipientKeyToJson(this);
}
