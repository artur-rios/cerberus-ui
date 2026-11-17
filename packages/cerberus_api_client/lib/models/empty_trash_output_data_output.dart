// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'empty_trash_output.dart';

part 'empty_trash_output_data_output.g.dart';

@JsonSerializable()
class EmptyTrashOutputDataOutput {
  const EmptyTrashOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory EmptyTrashOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$EmptyTrashOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final EmptyTrashOutput? data;

  Map<String, Object?> toJson() => _$EmptyTrashOutputDataOutputToJson(this);
}
