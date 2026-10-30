// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_initialization_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultInitializationOutput _$VaultInitializationOutputFromJson(
  Map<String, dynamic> json,
) => VaultInitializationOutput(
  accountId: json['accountId'] as String?,
  protectionRevision: (json['protectionRevision'] as num?)?.toInt(),
  keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
  recoveryGeneration: (json['recoveryGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$VaultInitializationOutputToJson(
  VaultInitializationOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'protectionRevision': instance.protectionRevision,
  'keyEpoch': instance.keyEpoch,
  'recoveryGeneration': instance.recoveryGeneration,
};
