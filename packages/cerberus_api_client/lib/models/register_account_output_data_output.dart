// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'register_account_output.dart';

part 'register_account_output_data_output.g.dart';

@JsonSerializable()
class RegisterAccountOutputDataOutput {
  const RegisterAccountOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory RegisterAccountOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$RegisterAccountOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final RegisterAccountOutput? data;

  Map<String, Object?> toJson() =>
      _$RegisterAccountOutputDataOutputToJson(this);
}
