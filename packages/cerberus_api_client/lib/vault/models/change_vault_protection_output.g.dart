// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_vault_protection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeVaultProtectionOutput _$ChangeVaultProtectionOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'protectionRevision',
      'keyEpoch',
      'recoveryGeneration',
      'accountRevision',
    ],
    disallowNullValues: const [
      'accountId',
      'protectionRevision',
      'keyEpoch',
      'recoveryGeneration',
      'accountRevision',
    ],
  );
  return ChangeVaultProtectionOutput(
    accountId: json['accountId'] as String?,
    protectionRevision: ChangeVaultProtectionOutput._read_protectionRevision(
      json['protectionRevision'],
    ),
    keyEpoch: ChangeVaultProtectionOutput._read_keyEpoch(json['keyEpoch']),
    recoveryGeneration: ChangeVaultProtectionOutput._read_recoveryGeneration(
      json['recoveryGeneration'],
    ),
    accountRevision: ChangeVaultProtectionOutput._read_accountRevision(
      json['accountRevision'],
    ),
  );
}

Map<String, dynamic> _$ChangeVaultProtectionOutputToJson(
  ChangeVaultProtectionOutput instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'protectionRevision': ?ChangeVaultProtectionOutput._write_protectionRevision(
    instance.protectionRevision,
  ),
  'keyEpoch': ?ChangeVaultProtectionOutput._write_keyEpoch(instance.keyEpoch),
  'recoveryGeneration': ?ChangeVaultProtectionOutput._write_recoveryGeneration(
    instance.recoveryGeneration,
  ),
  'accountRevision': ?ChangeVaultProtectionOutput._write_accountRevision(
    instance.accountRevision,
  ),
};
