// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_protection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportProtection _$AccountExportProtectionFromJson(
  Map<String, dynamic> json,
) => AccountExportProtection(
  revision: (json['revision'] as num).toInt(),
  keyEpoch: (json['keyEpoch'] as num).toInt(),
  recoveryGeneration: (json['recoveryGeneration'] as num).toInt(),
  material: json['material'] as String?,
  entryType: AccountExportProtectionEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportProtectionToJson(
  AccountExportProtection instance,
) => <String, dynamic>{
  'revision': instance.revision,
  'keyEpoch': instance.keyEpoch,
  'recoveryGeneration': instance.recoveryGeneration,
  'material': instance.material,
  'entryType': _$AccountExportProtectionEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportProtectionEntryTypeEnumMap = {
  AccountExportProtectionEntryType.protection: 'protection',
  AccountExportProtectionEntryType.$unknown: r'$unknown',
};
