// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'process_output.g.dart';

@JsonSerializable()
class ProcessOutput {
  const ProcessOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
  });

  factory ProcessOutput.fromJson(Map<String, Object?> json) =>
      _$ProcessOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;

  Map<String, Object?> toJson() => _$ProcessOutputToJson(this);
}
