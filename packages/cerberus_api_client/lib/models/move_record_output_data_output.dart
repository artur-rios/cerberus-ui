// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'move_record_output.dart';

part 'move_record_output_data_output.g.dart';

@JsonSerializable()
class MoveRecordOutputDataOutput {
  const MoveRecordOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory MoveRecordOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$MoveRecordOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final MoveRecordOutput? data;

  Map<String, Object?> toJson() => _$MoveRecordOutputDataOutputToJson(this);
}
