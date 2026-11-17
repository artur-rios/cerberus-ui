// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'create_collection_output.g.dart';

@JsonSerializable()
class CreateCollectionOutput {
  const CreateCollectionOutput({
    this.collectionId,
    this.revision,
    this.serverSequence,
    this.editedAt,
  });

  factory CreateCollectionOutput.fromJson(Map<String, Object?> json) =>
      _$CreateCollectionOutputFromJson(json);

  final String? collectionId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;

  Map<String, Object?> toJson() => _$CreateCollectionOutputToJson(this);
}
