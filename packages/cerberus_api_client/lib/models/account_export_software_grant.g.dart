// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_software_grant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportSoftwareGrant _$AccountExportSoftwareGrantFromJson(
  Map<String, dynamic> json,
) => AccountExportSoftwareGrant(
  grantId: json['grantId'] as String,
  softwareId: json['softwareId'] as String,
  state: AccountExportSoftwareGrantState.fromJson(json['state'] as String),
  revision: (json['revision'] as num).toInt(),
  recipientKey: json['recipientKey'] as String?,
  entryType: AccountExportSoftwareGrantEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportSoftwareGrantToJson(
  AccountExportSoftwareGrant instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'softwareId': instance.softwareId,
  'state': _$AccountExportSoftwareGrantStateEnumMap[instance.state]!,
  'revision': instance.revision,
  'recipientKey': instance.recipientKey,
  'entryType':
      _$AccountExportSoftwareGrantEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportSoftwareGrantStateEnumMap = {
  AccountExportSoftwareGrantState.active: 'active',
  AccountExportSoftwareGrantState.revoked: 'revoked',
  AccountExportSoftwareGrantState.$unknown: r'$unknown',
};

const _$AccountExportSoftwareGrantEntryTypeEnumMap = {
  AccountExportSoftwareGrantEntryType.softwareGrant: 'software-grant',
  AccountExportSoftwareGrantEntryType.$unknown: r'$unknown',
};
