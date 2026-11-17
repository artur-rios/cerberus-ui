// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_archive.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportArchive _$AccountExportArchiveFromJson(
  Map<String, dynamic> json,
) => AccountExportArchive(
  format: AccountExportArchiveFormat.fromJson(json['format'] as String),
  header: AccountExportHeader.fromJson(json['header'] as Map<String, dynamic>),
  entries: (json['entries'] as List<dynamic>?)
      ?.map(
        (e) => AccountExportArchiveEntriesSealed.fromJson(
          e as Map<String, dynamic>,
        ),
      )
      .toList(),
  entryCount: (json['entryCount'] as num).toInt(),
  complete: AccountExportArchiveComplete.fromJson(json['complete'] as bool),
);

Map<String, dynamic> _$AccountExportArchiveToJson(
  AccountExportArchive instance,
) => <String, dynamic>{
  'format': _$AccountExportArchiveFormatEnumMap[instance.format]!,
  'header': instance.header,
  'entries': instance.entries,
  'entryCount': instance.entryCount,
  'complete': _$AccountExportArchiveCompleteEnumMap[instance.complete]!,
};

const _$AccountExportArchiveFormatEnumMap = {
  AccountExportArchiveFormat.cerberusAccountExportV1:
      'cerberus-account-export-v1',
  AccountExportArchiveFormat.$unknown: r'$unknown',
};

const _$AccountExportArchiveCompleteEnumMap = {
  AccountExportArchiveComplete.valueTrue: 'true',
  AccountExportArchiveComplete.$unknown: r'$unknown',
};
