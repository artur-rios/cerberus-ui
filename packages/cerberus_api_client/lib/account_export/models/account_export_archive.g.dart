// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportArchive _$AccountExportArchiveFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'format',
      'header',
      'entries',
      'entryCount',
      'complete',
    ],
    requiredKeys: const [
      'format',
      'header',
      'entries',
      'entryCount',
      'complete',
    ],
    disallowNullValues: const ['format', 'header', 'entryCount', 'complete'],
  );
  return AccountExportArchive(
    format: AccountExportArchive._read_format(json['format']),
    header: AccountExportHeader.fromJson(
      json['header'] as Map<String, dynamic>,
    ),
    entries: AccountExportArchive._read_entries(json['entries']),
    entryCount: AccountExportArchive._read_entryCount(json['entryCount']),
    complete: AccountExportArchive._read_complete(json['complete']),
  );
}

Map<String, dynamic> _$AccountExportArchiveToJson(
  AccountExportArchive instance,
) => <String, dynamic>{
  'format': ?AccountExportArchive._write_format(instance.format),
  'header': instance.header.toJson(),
  'entries': AccountExportArchive._write_entries(instance.entries),
  'entryCount': ?AccountExportArchive._write_entryCount(instance.entryCount),
  'complete': ?AccountExportArchive._write_complete(instance.complete),
};
