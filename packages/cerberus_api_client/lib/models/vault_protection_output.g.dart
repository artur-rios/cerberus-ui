// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_protection_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultProtectionOutput _$VaultProtectionOutputFromJson(
  Map<String, dynamic> json,
) => VaultProtectionOutput(
  material: ProtectionMaterial.fromJson(
    json['material'] as Map<String, dynamic>,
  ),
  accountId: json['accountId'] as String?,
  protectionRevision: (json['protectionRevision'] as num?)?.toInt(),
  keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
  recoveryGeneration: (json['recoveryGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$VaultProtectionOutputToJson(
  VaultProtectionOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'protectionRevision': instance.protectionRevision,
  'keyEpoch': instance.keyEpoch,
  'recoveryGeneration': instance.recoveryGeneration,
  'material': instance.material,
};
