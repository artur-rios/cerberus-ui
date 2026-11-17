// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'update_record_output.g.dart';

@JsonSerializable()
class UpdateRecordOutput {
  const UpdateRecordOutput({
    this.recordId,
    this.revision,
    this.serverSequence,
    this.editedAt,
  });

  factory UpdateRecordOutput.fromJson(Map<String, Object?> json) =>
      _$UpdateRecordOutputFromJson(json);

  final String? recordId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;

  Map<String, Object?> toJson() => _$UpdateRecordOutputToJson(this);
}
