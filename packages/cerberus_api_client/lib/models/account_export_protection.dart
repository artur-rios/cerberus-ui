// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_protection_entry_type.dart';

part 'account_export_protection.g.dart';

@JsonSerializable()
class AccountExportProtection {
  const AccountExportProtection({
    required this.revision,
    required this.keyEpoch,
    required this.recoveryGeneration,
    required this.material,
    required this.entryType,
  });

  factory AccountExportProtection.fromJson(Map<String, Object?> json) =>
      _$AccountExportProtectionFromJson(json);

  final int revision;
  final int keyEpoch;
  final int recoveryGeneration;
  final String? material;
  final AccountExportProtectionEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportProtectionToJson(this);
}
