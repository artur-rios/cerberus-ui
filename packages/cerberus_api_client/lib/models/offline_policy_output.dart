// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'offline_policy_output.g.dart';

@JsonSerializable()
class OfflinePolicyOutput {
  const OfflinePolicyOutput({
    this.renewalEnabled,
    this.renewalInterval,
    this.policyRevision,
    this.revocationGeneration,
  });

  factory OfflinePolicyOutput.fromJson(Map<String, Object?> json) =>
      _$OfflinePolicyOutputFromJson(json);

  final bool? renewalEnabled;
  final String? renewalInterval;
  final int? policyRevision;
  final int? revocationGeneration;

  Map<String, Object?> toJson() => _$OfflinePolicyOutputToJson(this);
}
