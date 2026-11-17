// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_record_output.g.dart';

@JsonSerializable()
class DeleteRecordOutput {
  const DeleteRecordOutput({
    this.recordId,
    this.trashOperationId,
    this.revision,
    this.serverSequence,
    this.deletedAt,
    this.purgeAt,
  });

  factory DeleteRecordOutput.fromJson(Map<String, Object?> json) =>
      _$DeleteRecordOutputFromJson(json);

  final String? recordId;
  final String? trashOperationId;
  final int? revision;
  final int? serverSequence;
  final DateTime? deletedAt;
  final DateTime? purgeAt;

  Map<String, Object?> toJson() => _$DeleteRecordOutputToJson(this);
}
