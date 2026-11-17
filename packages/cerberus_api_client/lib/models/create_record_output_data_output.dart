// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'create_record_output.dart';

part 'create_record_output_data_output.g.dart';

@JsonSerializable()
class CreateRecordOutputDataOutput {
  const CreateRecordOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory CreateRecordOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$CreateRecordOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final CreateRecordOutput? data;

  Map<String, Object?> toJson() => _$CreateRecordOutputDataOutputToJson(this);
}
