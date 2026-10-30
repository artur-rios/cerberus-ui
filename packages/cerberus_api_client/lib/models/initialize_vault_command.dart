// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'protection_material.dart';

part 'initialize_vault_command.g.dart';

@JsonSerializable()
class InitializeVaultCommand {
  const InitializeVaultCommand({
    this.accountId,
    this.expectedAccountRevision,
    this.material,
  });

  factory InitializeVaultCommand.fromJson(Map<String, Object?> json) =>
      _$InitializeVaultCommandFromJson(json);

  final String? accountId;
  final int? expectedAccountRevision;
  final ProtectionMaterial? material;

  Map<String, Object?> toJson() => _$InitializeVaultCommandToJson(this);
}
