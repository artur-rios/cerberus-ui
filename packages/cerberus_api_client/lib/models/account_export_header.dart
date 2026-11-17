// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'account_export_header.g.dart';

@JsonSerializable()
class AccountExportHeader {
  const AccountExportHeader({
    required this.accountId,
    required this.identityId,
    required this.revision,
    required this.policyRevision,
    required this.revocationGeneration,
    required this.renewalEnabled,
    required this.renewalIntervalSeconds,
    required this.serverTime,
  });

  factory AccountExportHeader.fromJson(Map<String, Object?> json) =>
      _$AccountExportHeaderFromJson(json);

  final String accountId;
  final String identityId;
  final int revision;
  final int policyRevision;
  final int revocationGeneration;
  final bool renewalEnabled;
  final int? renewalIntervalSeconds;
  final DateTime serverTime;

  Map<String, Object?> toJson() => _$AccountExportHeaderToJson(this);
}
