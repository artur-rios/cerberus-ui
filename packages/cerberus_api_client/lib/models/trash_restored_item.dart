// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'trash_restored_item.g.dart';

@JsonSerializable()
class TrashRestoredItem {
  const TrashRestoredItem({
    required this.kind,
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
  });

  factory TrashRestoredItem.fromJson(Map<String, Object?> json) =>
      _$TrashRestoredItemFromJson(json);

  final String? kind;
  final String resourceId;
  final int revision;
  final int serverSequence;
  final DateTime editedAt;

  Map<String, Object?> toJson() => _$TrashRestoredItemToJson(this);
}
