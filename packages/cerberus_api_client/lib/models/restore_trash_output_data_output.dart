// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'restore_trash_output.dart';

part 'restore_trash_output_data_output.g.dart';

@JsonSerializable()
class RestoreTrashOutputDataOutput {
  const RestoreTrashOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory RestoreTrashOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$RestoreTrashOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final RestoreTrashOutput? data;

  Map<String, Object?> toJson() => _$RestoreTrashOutputDataOutputToJson(this);
}
