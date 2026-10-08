// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'heimdall_login.g.dart';

@JsonSerializable()
class HeimdallLogin {
  const HeimdallLogin({
    this.token,
    this.expiresAt,
    this.emailVerified,
    this.requiresTwoFactor,
    this.challengeToken,
    this.availableMethods,
  });

  factory HeimdallLogin.fromJson(Map<String, Object?> json) =>
      _$HeimdallLoginFromJson(json);

  final String? token;
  final DateTime? expiresAt;
  final bool? emailVerified;
  final bool? requiresTwoFactor;
  final String? challengeToken;
  final List<String>? availableMethods;

  Map<String, Object?> toJson() => _$HeimdallLoginToJson(this);
}
