// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'create_profile_output.dart';

part 'create_profile_output_data_output.g.dart';

@JsonSerializable()
class CreateProfileOutputDataOutput {
  const CreateProfileOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory CreateProfileOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$CreateProfileOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final CreateProfileOutput? data;

  Map<String, Object?> toJson() => _$CreateProfileOutputDataOutputToJson(this);
}
