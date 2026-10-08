// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'authentication_output.dart';

part 'authentication_output_data_output.g.dart';

@JsonSerializable()
class AuthenticationOutputDataOutput {
  const AuthenticationOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory AuthenticationOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$AuthenticationOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final AuthenticationOutput? data;

  Map<String, Object?> toJson() => _$AuthenticationOutputDataOutputToJson(this);
}
