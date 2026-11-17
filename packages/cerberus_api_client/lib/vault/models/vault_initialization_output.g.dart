// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_initialization_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultInitializationOutput _$VaultInitializationOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'protectionRevision',
      'keyEpoch',
      'recoveryGeneration',
    ],
    disallowNullValues: const [
      'accountId',
      'protectionRevision',
      'keyEpoch',
      'recoveryGeneration',
    ],
  );
  return VaultInitializationOutput(
    accountId: json['accountId'] as String?,
    protectionRevision: VaultInitializationOutput._read_protectionRevision(
      json['protectionRevision'],
    ),
    keyEpoch: VaultInitializationOutput._read_keyEpoch(json['keyEpoch']),
    recoveryGeneration: VaultInitializationOutput._read_recoveryGeneration(
      json['recoveryGeneration'],
    ),
  );
}

Map<String, dynamic> _$VaultInitializationOutputToJson(
  VaultInitializationOutput instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'protectionRevision': ?VaultInitializationOutput._write_protectionRevision(
    instance.protectionRevision,
  ),
  'keyEpoch': ?VaultInitializationOutput._write_keyEpoch(instance.keyEpoch),
  'recoveryGeneration': ?VaultInitializationOutput._write_recoveryGeneration(
    instance.recoveryGeneration,
  ),
};
