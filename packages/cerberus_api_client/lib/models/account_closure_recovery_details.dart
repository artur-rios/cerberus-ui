// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'account_closure_recovery_details.g.dart';

@JsonSerializable()
class AccountClosureRecoveryDetails {
  const AccountClosureRecoveryDetails({
    required this.accountId,
    required this.revision,
    required this.closureDeadline,
    required this.serverTime,
  });

  factory AccountClosureRecoveryDetails.fromJson(Map<String, Object?> json) =>
      _$AccountClosureRecoveryDetailsFromJson(json);

  final String accountId;
  final int revision;
  final DateTime closureDeadline;
  final DateTime serverTime;

  Map<String, Object?> toJson() => _$AccountClosureRecoveryDetailsToJson(this);
}
