// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_collection_update_edit_type.dart';
import 'sync_content_edit_input.dart';

part 'sync_collection_update.g.dart';

@JsonSerializable()
class SyncCollectionUpdate {
  const SyncCollectionUpdate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory SyncCollectionUpdate.fromJson(Map<String, Object?> json) =>
      _$SyncCollectionUpdateFromJson(json);

  final SyncContentEditInput input;
  final String operationId;
  final SyncCollectionUpdateEditType editType;

  Map<String, Object?> toJson() => _$SyncCollectionUpdateToJson(this);
}
