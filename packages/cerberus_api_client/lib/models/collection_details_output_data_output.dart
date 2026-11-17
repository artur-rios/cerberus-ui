// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'collection_details_output.dart';

part 'collection_details_output_data_output.g.dart';

@JsonSerializable()
class CollectionDetailsOutputDataOutput {
  const CollectionDetailsOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory CollectionDetailsOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$CollectionDetailsOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final CollectionDetailsOutput? data;

  Map<String, Object?> toJson() =>
      _$CollectionDetailsOutputDataOutputToJson(this);
}
