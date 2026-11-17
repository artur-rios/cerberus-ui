// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'move_record_command.g.dart';

@JsonSerializable()
class MoveRecordCommand {
  const MoveRecordCommand({
    required this.expectedRevision,
    required this.folderId,
  });

  factory MoveRecordCommand.fromJson(Map<String, Object?> json) =>
      _$MoveRecordCommandFromJson(json);

  final int expectedRevision;
  final String? folderId;

  Map<String, Object?> toJson() => _$MoveRecordCommandToJson(this);
}
