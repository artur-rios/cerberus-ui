// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'update_collection_output.g.dart';

@JsonSerializable()
class UpdateCollectionOutput {
  const UpdateCollectionOutput({
    this.collectionId,
    this.revision,
    this.serverSequence,
    this.editedAt,
  });

  factory UpdateCollectionOutput.fromJson(Map<String, Object?> json) =>
      _$UpdateCollectionOutputFromJson(json);

  final String? collectionId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;

  Map<String, Object?> toJson() => _$UpdateCollectionOutputToJson(this);
}
