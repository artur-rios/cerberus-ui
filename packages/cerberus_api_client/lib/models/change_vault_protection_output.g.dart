// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_vault_protection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeVaultProtectionOutput _$ChangeVaultProtectionOutputFromJson(
  Map<String, dynamic> json,
) => ChangeVaultProtectionOutput(
  accountId: json['accountId'] as String?,
  protectionRevision: (json['protectionRevision'] as num?)?.toInt(),
  keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
  recoveryGeneration: (json['recoveryGeneration'] as num?)?.toInt(),
  accountRevision: (json['accountRevision'] as num?)?.toInt(),
);

Map<String, dynamic> _$ChangeVaultProtectionOutputToJson(
  ChangeVaultProtectionOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'protectionRevision': instance.protectionRevision,
  'keyEpoch': instance.keyEpoch,
  'recoveryGeneration': instance.recoveryGeneration,
  'accountRevision': instance.accountRevision,
};
