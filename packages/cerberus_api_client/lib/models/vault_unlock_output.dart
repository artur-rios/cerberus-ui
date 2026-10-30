// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'vault_unlock_output.g.dart';

@JsonSerializable()
class VaultUnlockOutput {
  const VaultUnlockOutput({
    required this.vaultAccess,
    this.accountId,
    this.issuedAt,
    this.expiresAt,
  });

  factory VaultUnlockOutput.fromJson(Map<String, Object?> json) =>
      _$VaultUnlockOutputFromJson(json);

  final String? accountId;
  final String? vaultAccess;
  final DateTime? issuedAt;
  final DateTime? expiresAt;

  Map<String, Object?> toJson() => _$VaultUnlockOutputToJson(this);
}
