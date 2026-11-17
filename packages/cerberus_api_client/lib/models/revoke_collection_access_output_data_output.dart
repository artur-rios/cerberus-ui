// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'revoke_collection_access_output.dart';

part 'revoke_collection_access_output_data_output.g.dart';

@JsonSerializable()
class RevokeCollectionAccessOutputDataOutput {
  const RevokeCollectionAccessOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory RevokeCollectionAccessOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$RevokeCollectionAccessOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final RevokeCollectionAccessOutput? data;

  Map<String, Object?> toJson() =>
      _$RevokeCollectionAccessOutputDataOutputToJson(this);
}
