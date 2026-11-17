// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'trash_restore_omission.dart';
import 'trash_restored_item.dart';

part 'restore_trash_output.g.dart';

@JsonSerializable()
class RestoreTrashOutput {
  const RestoreTrashOutput({
    required this.operationId,
    required this.rootKind,
    required this.rootResourceId,
    required this.restoredAt,
    required this.items,
    required this.omissions,
  });

  factory RestoreTrashOutput.fromJson(Map<String, Object?> json) =>
      _$RestoreTrashOutputFromJson(json);

  final String operationId;
  final String? rootKind;
  final String rootResourceId;
  final DateTime restoredAt;
  final List<TrashRestoredItem>? items;
  final List<TrashRestoreOmission>? omissions;

  Map<String, Object?> toJson() => _$RestoreTrashOutputToJson(this);
}
