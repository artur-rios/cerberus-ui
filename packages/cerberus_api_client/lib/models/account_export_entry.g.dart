// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportEntry _$AccountExportEntryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['entryType'],
    requiredKeys: const ['entryType'],
    disallowNullValues: const ['entryType'],
  );
  return AccountExportEntry(entryType: json['entryType'] as String);
}

Map<String, dynamic> _$AccountExportEntryToJson(AccountExportEntry instance) =>
    <String, dynamic>{'entryType': instance.entryType};
