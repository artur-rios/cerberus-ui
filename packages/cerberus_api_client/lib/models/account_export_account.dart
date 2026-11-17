// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_account_entry_type.dart';

part 'account_export_account.g.dart';

@JsonSerializable()
class AccountExportAccount {
  const AccountExportAccount({required this.details, required this.entryType});

  factory AccountExportAccount.fromJson(Map<String, Object?> json) =>
      _$AccountExportAccountFromJson(json);

  final String? details;
  final AccountExportAccountEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportAccountToJson(this);
}
