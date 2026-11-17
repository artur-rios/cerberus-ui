// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'collection_list_output.dart';

part 'collection_list_output_data_output.g.dart';

@JsonSerializable()
class CollectionListOutputDataOutput {
  const CollectionListOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory CollectionListOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$CollectionListOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final CollectionListOutput? data;

  Map<String, Object?> toJson() => _$CollectionListOutputDataOutputToJson(this);
}
