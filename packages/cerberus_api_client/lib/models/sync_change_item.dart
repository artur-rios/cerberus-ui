// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_change_item_data_sealed.dart';

part 'sync_change_item.g.dart';

@JsonSerializable()
class SyncChangeItem {
  const SyncChangeItem({
    this.sequence,
    this.resourceKind,
    this.resourceId,
    this.eventType,
    this.data,
    this.deletedAt,
  });

  factory SyncChangeItem.fromJson(Map<String, Object?> json) =>
      _$SyncChangeItemFromJson(json);

  final int? sequence;
  final String? resourceKind;
  final String? resourceId;
  final String? eventType;
  final SyncChangeItemDataSealed? data;
  final DateTime? deletedAt;

  Map<String, Object?> toJson() => _$SyncChangeItemToJson(this);
}
