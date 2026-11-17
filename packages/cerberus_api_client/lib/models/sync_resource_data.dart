// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'sync_resource_data.g.dart';

@JsonSerializable()
class SyncResourceData {
  const SyncResourceData({
    required this.resourceType,
    this.resourceId,
    this.revision,
  });

  factory SyncResourceData.fromJson(Map<String, Object?> json) =>
      _$SyncResourceDataFromJson(json);

  final String resourceType;
  final String? resourceId;
  final int? revision;

  Map<String, Object?> toJson() => _$SyncResourceDataToJson(this);
}
