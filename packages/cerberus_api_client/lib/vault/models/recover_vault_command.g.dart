// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recover_vault_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoverVaultCommand _$RecoverVaultCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'operation',
      'idempotencyKey',
      'expectedRevision',
      'passwordWrapper',
      'recoveryWrapper',
      'newRecoveryVerifier',
    ],
    disallowNullValues: const [
      'idempotencyKey',
      'expectedRevision',
      'passwordWrapper',
      'recoveryWrapper',
      'newRecoveryVerifier',
    ],
  );
  return RecoverVaultCommand(
    operation: json['operation'] as String?,
    idempotencyKey: json['idempotencyKey'] as String?,
    expectedRevision: RecoverVaultCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    passwordWrapper: json['passwordWrapper'] == null
        ? null
        : PasswordWrapper.fromJson(
            json['passwordWrapper'] as Map<String, dynamic>,
          ),
    recoveryWrapper: json['recoveryWrapper'] == null
        ? null
        : RecoveryWrapper.fromJson(
            json['recoveryWrapper'] as Map<String, dynamic>,
          ),
    newRecoveryVerifier: json['newRecoveryVerifier'] == null
        ? null
        : PublicJwk.fromJson(
            json['newRecoveryVerifier'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$RecoverVaultCommandToJson(
  RecoverVaultCommand instance,
) => <String, dynamic>{
  'operation': ?instance.operation,
  'idempotencyKey': ?instance.idempotencyKey,
  'expectedRevision': ?RecoverVaultCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'passwordWrapper': ?instance.passwordWrapper?.toJson(),
  'recoveryWrapper': ?instance.recoveryWrapper?.toJson(),
  'newRecoveryVerifier': ?instance.newRecoveryVerifier?.toJson(),
};
