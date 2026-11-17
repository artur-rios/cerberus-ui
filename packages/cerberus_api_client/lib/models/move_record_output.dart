// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'move_record_output.g.dart';

@JsonSerializable()
class MoveRecordOutput {
  const MoveRecordOutput({
    this.recordId,
    this.folderId,
    this.revision,
    this.serverSequence,
  });

  factory MoveRecordOutput.fromJson(Map<String, Object?> json) =>
      _$MoveRecordOutputFromJson(json);

  final String? recordId;
  final String? folderId;
  final int? revision;
  final int? serverSequence;

  Map<String, Object?> toJson() => _$MoveRecordOutputToJson(this);
}
