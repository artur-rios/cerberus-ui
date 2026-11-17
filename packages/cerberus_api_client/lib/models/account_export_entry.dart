// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'account_export_entry.g.dart';

@JsonSerializable()
class AccountExportEntry {
  const AccountExportEntry({required this.entryType});

  factory AccountExportEntry.fromJson(Map<String, Object?> json) =>
      _$AccountExportEntryFromJson(json);

  final String entryType;

  Map<String, Object?> toJson() => _$AccountExportEntryToJson(this);
}
