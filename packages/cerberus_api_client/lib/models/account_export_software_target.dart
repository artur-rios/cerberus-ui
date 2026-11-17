// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_software_target_entry_type.dart';
import 'account_export_software_target_resource_kind.dart';

part 'account_export_software_target.g.dart';

@JsonSerializable()
class AccountExportSoftwareTarget {
  const AccountExportSoftwareTarget({
    required this.grantId,
    required this.resourceKind,
    required this.resourceId,
    required this.recipientKeyEnvelope,
    required this.entryType,
  });

  factory AccountExportSoftwareTarget.fromJson(Map<String, Object?> json) =>
      _$AccountExportSoftwareTargetFromJson(json);

  final String grantId;
  final AccountExportSoftwareTargetResourceKind resourceKind;
  final String resourceId;
  final String? recipientKeyEnvelope;
  final AccountExportSoftwareTargetEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportSoftwareTargetToJson(this);
}
