// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'create_collection_output.dart';

part 'create_collection_output_data_output.g.dart';

@JsonSerializable()
class CreateCollectionOutputDataOutput {
  const CreateCollectionOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory CreateCollectionOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$CreateCollectionOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final CreateCollectionOutput? data;

  Map<String, Object?> toJson() =>
      _$CreateCollectionOutputDataOutputToJson(this);
}
