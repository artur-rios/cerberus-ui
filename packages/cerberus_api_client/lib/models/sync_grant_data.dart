// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'recipient_envelope.dart';
import 'sync_grant_data_resource_type.dart';

part 'sync_grant_data.g.dart';

@JsonSerializable()
class SyncGrantData {
  const SyncGrantData({
    required this.collectionId,
    required this.recipientKeyEnvelope,
    required this.resourceId,
    required this.revision,
    required this.resourceType,
  });

  factory SyncGrantData.fromJson(Map<String, Object?> json) =>
      _$SyncGrantDataFromJson(json);

  final String collectionId;
  final RecipientEnvelope recipientKeyEnvelope;
  final String resourceId;
  final int revision;
  final SyncGrantDataResourceType resourceType;

  Map<String, Object?> toJson() => _$SyncGrantDataToJson(this);
}
