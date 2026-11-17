// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'collection_grant_replacement.dart';
import 'content_replacement.dart';
import 'protection_material.dart';

part 'change_vault_protection_command.g.dart';

@JsonSerializable()
class ChangeVaultProtectionCommand {
  const ChangeVaultProtectionCommand({
    this.accountId,
    this.expectedProtectionRevision,
    this.expectedAccountRevision,
    this.mode,
    this.material,
    this.contentReplacements,
    this.grantReplacements,
  });

  factory ChangeVaultProtectionCommand.fromJson(Map<String, Object?> json) =>
      _$ChangeVaultProtectionCommandFromJson(json);

  final String? accountId;
  final int? expectedProtectionRevision;
  final int? expectedAccountRevision;
  final String? mode;
  final ProtectionMaterial? material;
  final List<ContentReplacement>? contentReplacements;
  final List<CollectionGrantReplacement>? grantReplacements;

  Map<String, Object?> toJson() => _$ChangeVaultProtectionCommandToJson(this);
}
