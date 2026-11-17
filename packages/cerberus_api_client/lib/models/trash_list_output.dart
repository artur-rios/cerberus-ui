// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'trash_list_output_items_sealed.dart';

part 'trash_list_output.g.dart';

@JsonSerializable()
class TrashListOutput {
  const TrashListOutput({required this.items, required this.nextCursor});

  factory TrashListOutput.fromJson(Map<String, Object?> json) =>
      _$TrashListOutputFromJson(json);

  final List<TrashListOutputItemsSealed>? items;
  final String? nextCursor;

  Map<String, Object?> toJson() => _$TrashListOutputToJson(this);
}
