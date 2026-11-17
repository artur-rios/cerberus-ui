// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'sync_folder_data_resource_type.dart';

part 'sync_folder_data.g.dart';

@JsonSerializable()
class SyncFolderData {
  const SyncFolderData({
    required this.serverSequence,
    required this.editedAt,
    required this.envelope,
    required this.resourceId,
    required this.revision,
    required this.resourceType,
  });

  factory SyncFolderData.fromJson(Map<String, Object?> json) =>
      _$SyncFolderDataFromJson(json);

  final int serverSequence;
  final DateTime editedAt;
  final EncryptedEnvelope envelope;
  final String resourceId;
  final int revision;
  final SyncFolderDataResourceType resourceType;

  Map<String, Object?> toJson() => _$SyncFolderDataToJson(this);
}
