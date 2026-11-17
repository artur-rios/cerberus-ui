// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_archive_complete.dart';
import 'account_export_archive_entries_sealed.dart';
import 'account_export_archive_format.dart';
import 'account_export_header.dart';

part 'account_export_archive.g.dart';

@JsonSerializable()
class AccountExportArchive {
  const AccountExportArchive({
    required this.format,
    required this.header,
    required this.entries,
    required this.entryCount,
    required this.complete,
  });

  factory AccountExportArchive.fromJson(Map<String, Object?> json) =>
      _$AccountExportArchiveFromJson(json);

  final AccountExportArchiveFormat format;
  final AccountExportHeader header;
  final List<AccountExportArchiveEntriesSealed>? entries;
  final int entryCount;
  final AccountExportArchiveComplete complete;

  Map<String, Object?> toJson() => _$AccountExportArchiveToJson(this);
}
