// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'heimdall_registration.g.dart';

@JsonSerializable()
class HeimdallRegistration {
  const HeimdallRegistration({this.name, this.email, this.password});

  factory HeimdallRegistration.fromJson(Map<String, Object?> json) =>
      _$HeimdallRegistrationFromJson(json);

  final String? name;
  final String? email;
  final String? password;

  Map<String, Object?> toJson() => _$HeimdallRegistrationToJson(this);
}
