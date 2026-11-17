// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'permanently_delete_record_output.g.dart';

@JsonSerializable()
class PermanentlyDeleteRecordOutput {
  const PermanentlyDeleteRecordOutput({this.recordId, this.deletedAt});

  factory PermanentlyDeleteRecordOutput.fromJson(Map<String, Object?> json) =>
      _$PermanentlyDeleteRecordOutputFromJson(json);

  final String? recordId;
  final DateTime? deletedAt;

  Map<String, Object?> toJson() => _$PermanentlyDeleteRecordOutputToJson(this);
}
