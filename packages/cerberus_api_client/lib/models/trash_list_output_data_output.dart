// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'trash_list_output.dart';

part 'trash_list_output_data_output.g.dart';

@JsonSerializable()
class TrashListOutputDataOutput {
  const TrashListOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory TrashListOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$TrashListOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final TrashListOutput? data;

  Map<String, Object?> toJson() => _$TrashListOutputDataOutputToJson(this);
}
