// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_content_edit_input.dart';
import 'sync_record_update_edit_type.dart';

part 'sync_record_update.g.dart';

@JsonSerializable()
class SyncRecordUpdate {
  const SyncRecordUpdate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory SyncRecordUpdate.fromJson(Map<String, Object?> json) =>
      _$SyncRecordUpdateFromJson(json);

  final SyncContentEditInput input;
  final String operationId;
  final SyncRecordUpdateEditType editType;

  Map<String, Object?> toJson() => _$SyncRecordUpdateToJson(this);
}
