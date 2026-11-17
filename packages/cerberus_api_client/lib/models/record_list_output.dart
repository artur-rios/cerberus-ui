// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'record_list_item.dart';

part 'record_list_output.g.dart';

@JsonSerializable()
class RecordListOutput {
  const RecordListOutput({this.items, this.nextCursor});

  factory RecordListOutput.fromJson(Map<String, Object?> json) =>
      _$RecordListOutputFromJson(json);

  final List<RecordListItem>? items;
  final String? nextCursor;

  Map<String, Object?> toJson() => _$RecordListOutputToJson(this);
}
