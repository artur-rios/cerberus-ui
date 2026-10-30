// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'recover_vault_output.g.dart';

@JsonSerializable()
class RecoverVaultOutput {
  const RecoverVaultOutput({
    this.status,
    this.protectionRevision,
    this.generation,
    this.revocationGeneration,
  });

  factory RecoverVaultOutput.fromJson(Map<String, Object?> json) =>
      _$RecoverVaultOutputFromJson(json);

  final String? status;
  final int? protectionRevision;
  final int? generation;
  final int? revocationGeneration;

  Map<String, Object?> toJson() => _$RecoverVaultOutputToJson(this);
}
