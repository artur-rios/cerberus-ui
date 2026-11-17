// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'record_create_input.dart';
import 'sync_record_create_edit_type.dart';

part 'sync_record_create.g.dart';

@JsonSerializable()
class SyncRecordCreate {
  const SyncRecordCreate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory SyncRecordCreate.fromJson(Map<String, Object?> json) =>
      _$SyncRecordCreateFromJson(json);

  final RecordCreateInput input;
  final String operationId;
  final SyncRecordCreateEditType editType;

  Map<String, Object?> toJson() => _$SyncRecordCreateToJson(this);
}
