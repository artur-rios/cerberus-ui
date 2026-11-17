// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportInput _$AccountExportInputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision'],
    requiredKeys: const ['expectedRevision'],
    disallowNullValues: const ['expectedRevision'],
  );
  return AccountExportInput(
    expectedRevision: AccountExportInput._read_expectedRevision(
      json['expectedRevision'],
    ),
  );
}

Map<String, dynamic> _$AccountExportInputToJson(AccountExportInput instance) =>
    <String, dynamic>{
      'expectedRevision': ?AccountExportInput._write_expectedRevision(
        instance.expectedRevision,
      ),
    };
