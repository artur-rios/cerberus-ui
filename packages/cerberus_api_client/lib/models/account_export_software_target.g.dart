// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_software_target.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportSoftwareTarget _$AccountExportSoftwareTargetFromJson(
  Map<String, dynamic> json,
) => AccountExportSoftwareTarget(
  grantId: json['grantId'] as String,
  resourceKind: AccountExportSoftwareTargetResourceKind.fromJson(
    json['resourceKind'] as String,
  ),
  resourceId: json['resourceId'] as String,
  recipientKeyEnvelope: json['recipientKeyEnvelope'] as String?,
  entryType: AccountExportSoftwareTargetEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportSoftwareTargetToJson(
  AccountExportSoftwareTarget instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'resourceKind':
      _$AccountExportSoftwareTargetResourceKindEnumMap[instance.resourceKind]!,
  'resourceId': instance.resourceId,
  'recipientKeyEnvelope': instance.recipientKeyEnvelope,
  'entryType':
      _$AccountExportSoftwareTargetEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportSoftwareTargetResourceKindEnumMap = {
  AccountExportSoftwareTargetResourceKind.record: 'record',
  AccountExportSoftwareTargetResourceKind.collection: 'collection',
  AccountExportSoftwareTargetResourceKind.$unknown: r'$unknown',
};

const _$AccountExportSoftwareTargetEntryTypeEnumMap = {
  AccountExportSoftwareTargetEntryType.softwareTarget: 'software-target',
  AccountExportSoftwareTargetEntryType.$unknown: r'$unknown',
};
