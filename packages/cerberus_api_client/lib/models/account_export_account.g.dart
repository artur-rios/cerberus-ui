// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportAccount _$AccountExportAccountFromJson(
  Map<String, dynamic> json,
) => AccountExportAccount(
  details: json['details'] as String?,
  entryType: AccountExportAccountEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportAccountToJson(
  AccountExportAccount instance,
) => <String, dynamic>{
  'details': instance.details,
  'entryType': _$AccountExportAccountEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportAccountEntryTypeEnumMap = {
  AccountExportAccountEntryType.account: 'account',
  AccountExportAccountEntryType.$unknown: r'$unknown',
};
