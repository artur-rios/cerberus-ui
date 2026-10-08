// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'update_identity_output.dart';

part 'update_identity_output_data_output.g.dart';

@JsonSerializable()
class UpdateIdentityOutputDataOutput {
  const UpdateIdentityOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory UpdateIdentityOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$UpdateIdentityOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final UpdateIdentityOutput? data;

  Map<String, Object?> toJson() => _$UpdateIdentityOutputDataOutputToJson(this);
}
