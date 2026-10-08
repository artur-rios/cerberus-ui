// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_vault_protection_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeVaultProtectionCommand _$ChangeVaultProtectionCommandFromJson(
  Map<String, dynamic> json,
) => ChangeVaultProtectionCommand(
  accountId: json['accountId'] as String?,
  expectedProtectionRevision: (json['expectedProtectionRevision'] as num?)
      ?.toInt(),
  expectedAccountRevision: (json['expectedAccountRevision'] as num?)?.toInt(),
  mode: json['mode'] as String?,
  material: json['material'] == null
      ? null
      : ProtectionMaterial.fromJson(json['material'] as Map<String, dynamic>),
  contentReplacements: (json['contentReplacements'] as List<dynamic>?)
      ?.map((e) => ContentReplacement.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ChangeVaultProtectionCommandToJson(
  ChangeVaultProtectionCommand instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'expectedProtectionRevision': instance.expectedProtectionRevision,
  'expectedAccountRevision': instance.expectedAccountRevision,
  'mode': instance.mode,
  'material': instance.material,
  'contentReplacements': instance.contentReplacements,
};
