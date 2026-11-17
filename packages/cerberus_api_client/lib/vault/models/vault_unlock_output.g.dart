// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_unlock_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultUnlockOutput _$VaultUnlockOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['accountId', 'vaultAccess', 'issuedAt', 'expiresAt'],
    requiredKeys: const ['vaultAccess'],
    disallowNullValues: const ['accountId', 'issuedAt'],
  );
  return VaultUnlockOutput(
    accountId: json['accountId'] as String?,
    vaultAccess: json['vaultAccess'] as String?,
    issuedAt: VaultUnlockOutput._read_issuedAt(json['issuedAt']),
    expiresAt: VaultUnlockOutput._read_expiresAt(json['expiresAt']),
  );
}

Map<String, dynamic> _$VaultUnlockOutputToJson(VaultUnlockOutput instance) =>
    <String, dynamic>{
      'accountId': ?instance.accountId,
      'vaultAccess': instance.vaultAccess,
      'issuedAt': ?VaultUnlockOutput._write_issuedAt(instance.issuedAt),
      'expiresAt': ?VaultUnlockOutput._write_expiresAt(instance.expiresAt),
    };
