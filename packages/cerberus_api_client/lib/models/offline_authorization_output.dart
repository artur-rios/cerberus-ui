// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'offline_grant_revision.dart';

part 'offline_authorization_output.g.dart';

@JsonSerializable()
class OfflineAuthorizationOutput {
  const OfflineAuthorizationOutput({
    this.lease,
    this.accountId,
    this.profileId,
    this.keyEpoch,
    this.protectionRevision,
    this.policyRevision,
    this.revocationGeneration,
    this.grantRevisions,
    this.renewalEnabled,
    this.issuedAt,
    this.expiresAt,
  });

  factory OfflineAuthorizationOutput.fromJson(Map<String, Object?> json) =>
      _$OfflineAuthorizationOutputFromJson(json);

  final String? lease;
  final String? accountId;
  final String? profileId;
  final int? keyEpoch;
  final int? protectionRevision;
  final int? policyRevision;
  final int? revocationGeneration;
  final List<OfflineGrantRevision>? grantRevisions;
  final bool? renewalEnabled;
  final DateTime? issuedAt;
  final DateTime? expiresAt;

  Map<String, Object?> toJson() => _$OfflineAuthorizationOutputToJson(this);
}
