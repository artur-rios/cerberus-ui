// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_protection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultProtectionOutput _$VaultProtectionOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'protectionRevision',
      'keyEpoch',
      'recoveryGeneration',
      'material',
    ],
    requiredKeys: const ['material'],
    disallowNullValues: const [
      'accountId',
      'protectionRevision',
      'keyEpoch',
      'recoveryGeneration',
      'material',
    ],
  );
  return VaultProtectionOutput(
    accountId: json['accountId'] as String?,
    protectionRevision: VaultProtectionOutput._read_protectionRevision(
      json['protectionRevision'],
    ),
    keyEpoch: VaultProtectionOutput._read_keyEpoch(json['keyEpoch']),
    recoveryGeneration: VaultProtectionOutput._read_recoveryGeneration(
      json['recoveryGeneration'],
    ),
    material: ProtectionMaterial.fromJson(
      json['material'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$VaultProtectionOutputToJson(
  VaultProtectionOutput instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'protectionRevision': ?VaultProtectionOutput._write_protectionRevision(
    instance.protectionRevision,
  ),
  'keyEpoch': ?VaultProtectionOutput._write_keyEpoch(instance.keyEpoch),
  'recoveryGeneration': ?VaultProtectionOutput._write_recoveryGeneration(
    instance.recoveryGeneration,
  ),
  'material': instance.material.toJson(),
};
