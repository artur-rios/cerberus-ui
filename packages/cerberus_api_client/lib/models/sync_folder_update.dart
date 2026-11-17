// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_content_edit_input.dart';
import 'sync_folder_update_edit_type.dart';

part 'sync_folder_update.g.dart';

@JsonSerializable()
class SyncFolderUpdate {
  const SyncFolderUpdate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory SyncFolderUpdate.fromJson(Map<String, Object?> json) =>
      _$SyncFolderUpdateFromJson(json);

  final SyncContentEditInput input;
  final String operationId;
  final SyncFolderUpdateEditType editType;

  Map<String, Object?> toJson() => _$SyncFolderUpdateToJson(this);
}
