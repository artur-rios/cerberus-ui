// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'record_list_output.dart';

part 'record_list_output_data_output.g.dart';

@JsonSerializable()
class RecordListOutputDataOutput {
  const RecordListOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory RecordListOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$RecordListOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final RecordListOutput? data;

  Map<String, Object?> toJson() => _$RecordListOutputDataOutputToJson(this);
}
