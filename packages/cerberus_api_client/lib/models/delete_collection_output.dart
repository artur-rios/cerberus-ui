// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_collection_output.g.dart';

@JsonSerializable()
class DeleteCollectionOutput {
  const DeleteCollectionOutput({
    this.collectionId,
    this.trashOperationId,
    this.revision,
    this.serverSequence,
    this.deletedAt,
    this.purgeAt,
  });

  factory DeleteCollectionOutput.fromJson(Map<String, Object?> json) =>
      _$DeleteCollectionOutputFromJson(json);

  final String? collectionId;
  final String? trashOperationId;
  final int? revision;
  final int? serverSequence;
  final DateTime? deletedAt;
  final DateTime? purgeAt;

  Map<String, Object?> toJson() => _$DeleteCollectionOutputToJson(this);
}
