// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_deletion_output.dart';

part 'account_deletion_output_data_output.g.dart';

@JsonSerializable()
class AccountDeletionOutputDataOutput {
  const AccountDeletionOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory AccountDeletionOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$AccountDeletionOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final AccountDeletionOutput? data;

  Map<String, Object?> toJson() =>
      _$AccountDeletionOutputDataOutputToJson(this);
}
