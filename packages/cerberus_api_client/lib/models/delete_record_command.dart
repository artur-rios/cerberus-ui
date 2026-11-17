// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_record_command.g.dart';

@JsonSerializable()
class DeleteRecordCommand {
  const DeleteRecordCommand({required this.expectedRevision});

  factory DeleteRecordCommand.fromJson(Map<String, Object?> json) =>
      _$DeleteRecordCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$DeleteRecordCommandToJson(this);
}
