// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'upload_sync_edits_command_edits_sealed.dart';

part 'upload_sync_edits_command.g.dart';

@JsonSerializable()
class UploadSyncEditsCommand {
  const UploadSyncEditsCommand({required this.edits});

  factory UploadSyncEditsCommand.fromJson(Map<String, Object?> json) =>
      _$UploadSyncEditsCommandFromJson(json);

  final List<UploadSyncEditsCommandEditsSealed> edits;

  Map<String, Object?> toJson() => _$UploadSyncEditsCommandToJson(this);
}
