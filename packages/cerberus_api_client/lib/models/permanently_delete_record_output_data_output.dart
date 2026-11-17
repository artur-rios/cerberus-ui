// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'permanently_delete_record_output.dart';

part 'permanently_delete_record_output_data_output.g.dart';

@JsonSerializable()
class PermanentlyDeleteRecordOutputDataOutput {
  const PermanentlyDeleteRecordOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory PermanentlyDeleteRecordOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$PermanentlyDeleteRecordOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final PermanentlyDeleteRecordOutput? data;

  Map<String, Object?> toJson() =>
      _$PermanentlyDeleteRecordOutputDataOutputToJson(this);
}
