// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'profile_key_wrappers.dart';
import 'sync_profile_data_resource_type.dart';

part 'sync_profile_data.g.dart';

@JsonSerializable()
class SyncProfileData {
  const SyncProfileData({
    required this.serverSequence,
    required this.editedAt,
    required this.envelope,
    required this.keyWrappers,
    required this.recordIds,
    required this.folderIds,
    required this.collectionIds,
    required this.resourceId,
    required this.revision,
    required this.resourceType,
  });

  factory SyncProfileData.fromJson(Map<String, Object?> json) =>
      _$SyncProfileDataFromJson(json);

  final int serverSequence;
  final DateTime editedAt;
  final EncryptedEnvelope envelope;
  final ProfileKeyWrappers keyWrappers;
  final List<String>? recordIds;
  final List<String>? folderIds;
  final List<String>? collectionIds;
  final String resourceId;
  final int revision;
  final SyncProfileDataResourceType resourceType;

  Map<String, Object?> toJson() => _$SyncProfileDataToJson(this);
}
