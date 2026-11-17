// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'offline_policy_output.dart';

part 'offline_policy_output_data_output.g.dart';

@JsonSerializable()
class OfflinePolicyOutputDataOutput {
  const OfflinePolicyOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory OfflinePolicyOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$OfflinePolicyOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final OfflinePolicyOutput? data;

  Map<String, Object?> toJson() => _$OfflinePolicyOutputDataOutputToJson(this);
}
