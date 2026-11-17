// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'create_folder_output.dart';

part 'create_folder_output_data_output.g.dart';

@JsonSerializable()
class CreateFolderOutputDataOutput {
  const CreateFolderOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory CreateFolderOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$CreateFolderOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final CreateFolderOutput? data;

  Map<String, Object?> toJson() => _$CreateFolderOutputDataOutputToJson(this);
}
