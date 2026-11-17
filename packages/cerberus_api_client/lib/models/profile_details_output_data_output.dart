// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'profile_details_output.dart';

part 'profile_details_output_data_output.g.dart';

@JsonSerializable()
class ProfileDetailsOutputDataOutput {
  const ProfileDetailsOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory ProfileDetailsOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$ProfileDetailsOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final ProfileDetailsOutput? data;

  Map<String, Object?> toJson() => _$ProfileDetailsOutputDataOutputToJson(this);
}
