// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'account_closure_cancellation_output.g.dart';

@JsonSerializable()
class AccountClosureCancellationOutput {
  const AccountClosureCancellationOutput({
    required this.accountId,
    required this.revision,
    required this.revocationGeneration,
    required this.cancelledAt,
    required this.serverTime,
  });

  factory AccountClosureCancellationOutput.fromJson(
    Map<String, Object?> json,
  ) => _$AccountClosureCancellationOutputFromJson(json);

  final String accountId;
  final int revision;
  final int revocationGeneration;
  final DateTime cancelledAt;
  final DateTime serverTime;

  Map<String, Object?> toJson() =>
      _$AccountClosureCancellationOutputToJson(this);
}
