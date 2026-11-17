// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'folder_create_input.dart';
import 'sync_folder_create_edit_type.dart';

part 'sync_folder_create.g.dart';

@JsonSerializable()
class SyncFolderCreate {
  const SyncFolderCreate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory SyncFolderCreate.fromJson(Map<String, Object?> json) =>
      _$SyncFolderCreateFromJson(json);

  final FolderCreateInput input;
  final String operationId;
  final SyncFolderCreateEditType editType;

  Map<String, Object?> toJson() => _$SyncFolderCreateToJson(this);
}
