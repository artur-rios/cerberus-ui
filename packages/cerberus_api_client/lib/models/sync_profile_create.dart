// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'profile_create_input.dart';
import 'sync_profile_create_edit_type.dart';

part 'sync_profile_create.g.dart';

@JsonSerializable()
class SyncProfileCreate {
  const SyncProfileCreate({
    required this.input,
    required this.operationId,
    required this.editType,
  });

  factory SyncProfileCreate.fromJson(Map<String, Object?> json) =>
      _$SyncProfileCreateFromJson(json);

  final ProfileCreateInput input;
  final String operationId;
  final SyncProfileCreateEditType editType;

  Map<String, Object?> toJson() => _$SyncProfileCreateToJson(this);
}
