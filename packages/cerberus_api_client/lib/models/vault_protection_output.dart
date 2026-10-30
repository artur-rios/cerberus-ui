// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'protection_material.dart';

part 'vault_protection_output.g.dart';

@JsonSerializable()
class VaultProtectionOutput {
  const VaultProtectionOutput({
    required this.material,
    this.accountId,
    this.protectionRevision,
    this.keyEpoch,
    this.recoveryGeneration,
  });

  factory VaultProtectionOutput.fromJson(Map<String, Object?> json) =>
      _$VaultProtectionOutputFromJson(json);

  final String? accountId;
  final int? protectionRevision;
  final int? keyEpoch;
  final int? recoveryGeneration;
  final ProtectionMaterial material;

  Map<String, Object?> toJson() => _$VaultProtectionOutputToJson(this);
}
