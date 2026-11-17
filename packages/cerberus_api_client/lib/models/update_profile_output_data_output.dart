// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'update_profile_output.dart';

part 'update_profile_output_data_output.g.dart';

@JsonSerializable()
class UpdateProfileOutputDataOutput {
  const UpdateProfileOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory UpdateProfileOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$UpdateProfileOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final UpdateProfileOutput? data;

  Map<String, Object?> toJson() => _$UpdateProfileOutputDataOutputToJson(this);
}
