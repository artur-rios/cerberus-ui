// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'account_closure_output.g.dart';

@JsonSerializable()
class AccountClosureOutput {
  const AccountClosureOutput({
    required this.accountId,
    required this.revision,
    required this.revocationGeneration,
    required this.closureRequestedAt,
    required this.closureDeadline,
    required this.serverTime,
    required this.alreadyPending,
  });

  factory AccountClosureOutput.fromJson(Map<String, Object?> json) =>
      _$AccountClosureOutputFromJson(json);

  final String accountId;
  final int revision;
  final int revocationGeneration;
  final DateTime closureRequestedAt;
  final DateTime closureDeadline;
  final DateTime serverTime;
  final bool alreadyPending;

  Map<String, Object?> toJson() => _$AccountClosureOutputToJson(this);
}
