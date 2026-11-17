// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'create_record_output.g.dart';

@JsonSerializable()
class CreateRecordOutput {
  const CreateRecordOutput({
    this.recordId,
    this.revision,
    this.serverSequence,
    this.editedAt,
  });

  factory CreateRecordOutput.fromJson(Map<String, Object?> json) =>
      _$CreateRecordOutputFromJson(json);

  final String? recordId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;

  Map<String, Object?> toJson() => _$CreateRecordOutputToJson(this);
}
