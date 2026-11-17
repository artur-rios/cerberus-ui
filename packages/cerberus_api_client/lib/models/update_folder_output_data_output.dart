// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'update_folder_output.dart';

part 'update_folder_output_data_output.g.dart';

@JsonSerializable()
class UpdateFolderOutputDataOutput {
  const UpdateFolderOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory UpdateFolderOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$UpdateFolderOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final UpdateFolderOutput? data;

  Map<String, Object?> toJson() => _$UpdateFolderOutputDataOutputToJson(this);
}
