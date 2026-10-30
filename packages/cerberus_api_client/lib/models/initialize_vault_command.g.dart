// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialize_vault_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitializeVaultCommand _$InitializeVaultCommandFromJson(
  Map<String, dynamic> json,
) => InitializeVaultCommand(
  accountId: json['accountId'] as String?,
  expectedAccountRevision: (json['expectedAccountRevision'] as num?)?.toInt(),
  material: json['material'] == null
      ? null
      : ProtectionMaterial.fromJson(json['material'] as Map<String, dynamic>),
);

Map<String, dynamic> _$InitializeVaultCommandToJson(
  InitializeVaultCommand instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'expectedAccountRevision': instance.expectedAccountRevision,
  'material': instance.material,
};
