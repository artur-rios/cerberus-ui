// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'profile_access_context.dart';

part 'open_profile_access_output.g.dart';

@JsonSerializable()
class OpenProfileAccessOutput {
  const OpenProfileAccessOutput({
    this.accountId,
    this.vaultAccess,
    this.issuedAt,
    this.expiresAt,
    this.profile,
  });

  factory OpenProfileAccessOutput.fromJson(Map<String, Object?> json) =>
      _$OpenProfileAccessOutputFromJson(json);

  final String? accountId;
  final String? vaultAccess;
  final DateTime? issuedAt;
  final DateTime? expiresAt;
  final ProfileAccessContext? profile;

  Map<String, Object?> toJson() => _$OpenProfileAccessOutputToJson(this);
}
