// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_closure_cancellation_output.dart';

part 'account_closure_cancellation_output_data_output.g.dart';

@JsonSerializable()
class AccountClosureCancellationOutputDataOutput {
  const AccountClosureCancellationOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory AccountClosureCancellationOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$AccountClosureCancellationOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final AccountClosureCancellationOutput? data;

  Map<String, Object?> toJson() =>
      _$AccountClosureCancellationOutputDataOutputToJson(this);
}
