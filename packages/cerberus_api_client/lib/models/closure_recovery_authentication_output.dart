// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_closure_recovery_details.dart';
import 'heimdall_login.dart';

part 'closure_recovery_authentication_output.g.dart';

@JsonSerializable()
class ClosureRecoveryAuthenticationOutput {
  const ClosureRecoveryAuthenticationOutput({
    required this.identity,
    this.account,
  });

  factory ClosureRecoveryAuthenticationOutput.fromJson(
    Map<String, Object?> json,
  ) => _$ClosureRecoveryAuthenticationOutputFromJson(json);

  final HeimdallLogin identity;
  final AccountClosureRecoveryDetails? account;

  Map<String, Object?> toJson() =>
      _$ClosureRecoveryAuthenticationOutputToJson(this);
}
