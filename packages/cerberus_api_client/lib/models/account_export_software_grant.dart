// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_software_grant_entry_type.dart';
import 'account_export_software_grant_state.dart';

part 'account_export_software_grant.g.dart';

@JsonSerializable()
class AccountExportSoftwareGrant {
  const AccountExportSoftwareGrant({
    required this.grantId,
    required this.softwareId,
    required this.state,
    required this.revision,
    required this.recipientKey,
    required this.entryType,
  });

  factory AccountExportSoftwareGrant.fromJson(Map<String, Object?> json) =>
      _$AccountExportSoftwareGrantFromJson(json);

  final String grantId;
  final String softwareId;
  final AccountExportSoftwareGrantState state;
  final int revision;
  final String? recipientKey;
  final AccountExportSoftwareGrantEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportSoftwareGrantToJson(this);
}
