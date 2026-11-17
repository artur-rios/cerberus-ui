// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'closure_recovery_authentication_output.dart';

part 'closure_recovery_authentication_output_data_output.g.dart';

@JsonSerializable()
class ClosureRecoveryAuthenticationOutputDataOutput {
  const ClosureRecoveryAuthenticationOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory ClosureRecoveryAuthenticationOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$ClosureRecoveryAuthenticationOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final ClosureRecoveryAuthenticationOutput? data;

  Map<String, Object?> toJson() =>
      _$ClosureRecoveryAuthenticationOutputDataOutputToJson(this);
}
