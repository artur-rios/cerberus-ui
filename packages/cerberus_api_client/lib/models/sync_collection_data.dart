// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'sync_collection_data_resource_type.dart';

part 'sync_collection_data.g.dart';

@JsonSerializable()
class SyncCollectionData {
  const SyncCollectionData({
    required this.serverSequence,
    required this.editedAt,
    required this.envelope,
    required this.keyEpoch,
    required this.resourceId,
    required this.revision,
    required this.resourceType,
  });

  factory SyncCollectionData.fromJson(Map<String, Object?> json) =>
      _$SyncCollectionDataFromJson(json);

  final int serverSequence;
  final DateTime editedAt;
  final EncryptedEnvelope envelope;
  final int keyEpoch;
  final String resourceId;
  final int revision;
  final SyncCollectionDataResourceType resourceType;

  Map<String, Object?> toJson() => _$SyncCollectionDataToJson(this);
}
