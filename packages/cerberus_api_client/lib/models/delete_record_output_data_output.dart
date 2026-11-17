// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'delete_record_output.dart';

part 'delete_record_output_data_output.g.dart';

@JsonSerializable()
class DeleteRecordOutputDataOutput {
  const DeleteRecordOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory DeleteRecordOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$DeleteRecordOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final DeleteRecordOutput? data;

  Map<String, Object?> toJson() => _$DeleteRecordOutputDataOutputToJson(this);
}
