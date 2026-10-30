// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'password_wrapper.dart';
import 'public_jwk.dart';
import 'recovery_wrapper.dart';

part 'recover_vault_command.g.dart';

@JsonSerializable()
class RecoverVaultCommand {
  const RecoverVaultCommand({
    this.operation,
    this.idempotencyKey,
    this.expectedRevision,
    this.passwordWrapper,
    this.recoveryWrapper,
    this.newRecoveryVerifier,
  });

  factory RecoverVaultCommand.fromJson(Map<String, Object?> json) =>
      _$RecoverVaultCommandFromJson(json);

  final String? operation;
  final String? idempotencyKey;
  final int? expectedRevision;
  final PasswordWrapper? passwordWrapper;
  final RecoveryWrapper? recoveryWrapper;
  final PublicJwk? newRecoveryVerifier;

  Map<String, Object?> toJson() => _$RecoverVaultCommandToJson(this);
}
