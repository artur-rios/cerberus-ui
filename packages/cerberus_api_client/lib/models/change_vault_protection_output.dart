// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'change_vault_protection_output.g.dart';

@JsonSerializable()
class ChangeVaultProtectionOutput {
  const ChangeVaultProtectionOutput({
    this.accountId,
    this.protectionRevision,
    this.keyEpoch,
    this.recoveryGeneration,
    this.accountRevision,
  });

  factory ChangeVaultProtectionOutput.fromJson(Map<String, Object?> json) =>
      _$ChangeVaultProtectionOutputFromJson(json);

  final String? accountId;
  final int? protectionRevision;
  final int? keyEpoch;
  final int? recoveryGeneration;
  final int? accountRevision;

  Map<String, Object?> toJson() => _$ChangeVaultProtectionOutputToJson(this);
}
