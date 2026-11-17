// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'collection_create_input.dart';
import 'sync_collection_create_edit_type.dart';

part 'sync_collection_create.g.dart';

@JsonSerializable()
class SyncCollectionCreate {
  const SyncCollectionCreate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory SyncCollectionCreate.fromJson(Map<String, Object?> json) =>
      _$SyncCollectionCreateFromJson(json);

  final CollectionCreateInput input;
  final String operationId;
  final SyncCollectionCreateEditType editType;

  Map<String, Object?> toJson() => _$SyncCollectionCreateToJson(this);
}
