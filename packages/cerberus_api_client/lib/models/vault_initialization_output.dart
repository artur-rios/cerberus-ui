// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'vault_initialization_output.g.dart';

@JsonSerializable()
class VaultInitializationOutput {
  const VaultInitializationOutput({
    this.accountId,
    this.protectionRevision,
    this.keyEpoch,
    this.recoveryGeneration,
  });

  factory VaultInitializationOutput.fromJson(Map<String, Object?> json) =>
      _$VaultInitializationOutputFromJson(json);

  final String? accountId;
  final int? protectionRevision;
  final int? keyEpoch;
  final int? recoveryGeneration;

  Map<String, Object?> toJson() => _$VaultInitializationOutputToJson(this);
}
