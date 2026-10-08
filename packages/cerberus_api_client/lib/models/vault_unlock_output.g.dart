// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_unlock_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultUnlockOutput _$VaultUnlockOutputFromJson(Map<String, dynamic> json) =>
    VaultUnlockOutput(
      vaultAccess: json['vaultAccess'] as String?,
      accountId: json['accountId'] as String?,
      issuedAt: json['issuedAt'] == null
          ? null
          : DateTime.parse(json['issuedAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$VaultUnlockOutputToJson(VaultUnlockOutput instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'vaultAccess': instance.vaultAccess,
      'issuedAt': instance.issuedAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
    };
