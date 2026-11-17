// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'trash_purged_count_kind.dart';

part 'trash_purged_count.g.dart';

@JsonSerializable()
class TrashPurgedCount {
  const TrashPurgedCount({required this.kind, required this.count});

  factory TrashPurgedCount.fromJson(Map<String, Object?> json) =>
      _$TrashPurgedCountFromJson(json);

  final TrashPurgedCountKind kind;
  final int count;

  Map<String, Object?> toJson() => _$TrashPurgedCountToJson(this);
}
