// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'set_profile_associations_output.dart';

part 'set_profile_associations_output_data_output.g.dart';

@JsonSerializable()
class SetProfileAssociationsOutputDataOutput {
  const SetProfileAssociationsOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory SetProfileAssociationsOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$SetProfileAssociationsOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final SetProfileAssociationsOutput? data;

  Map<String, Object?> toJson() =>
      _$SetProfileAssociationsOutputDataOutputToJson(this);
}
