// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'profile_key_wrappers.dart';
import 'recipient_envelope.dart';
import 'sync_collection_data_resource_type.dart';
import 'sync_folder_data_resource_type.dart';
import 'sync_grant_data_resource_type.dart';
import 'sync_profile_data_resource_type.dart';
import 'sync_record_data_resource_type.dart';
import 'sync_profile_data.dart';
import 'sync_record_data.dart';
import 'sync_folder_data.dart';
import 'sync_collection_data.dart';
import 'sync_grant_data.dart';

part 'sync_change_item_data_sealed.g.dart';

@JsonSerializable(createFactory: false)
sealed class SyncChangeItemDataSealed {
  const SyncChangeItemDataSealed();

  factory SyncChangeItemDataSealed.fromJson(Map<String, dynamic> json) =>
      SyncChangeItemDataSealedDeserializer.tryDeserialize(json);

  Map<String, dynamic> toJson();
}

extension SyncChangeItemDataSealedDeserializer on SyncChangeItemDataSealed {
  static SyncChangeItemDataSealed tryDeserialize(Map<String, dynamic> json) {
    try {
      return SyncChangeItemDataSealedSyncProfileData.fromJson(json);
    } catch (_) {}
    try {
      return SyncChangeItemDataSealedSyncRecordData.fromJson(json);
    } catch (_) {}
    try {
      return SyncChangeItemDataSealedSyncFolderData.fromJson(json);
    } catch (_) {}
    try {
      return SyncChangeItemDataSealedSyncCollectionData.fromJson(json);
    } catch (_) {}
    try {
      return SyncChangeItemDataSealedSyncGrantData.fromJson(json);
    } catch (_) {}

    throw FormatException(
      'Could not determine the correct type for SyncChangeItemDataSealed from: $json',
    );
  }
}

@JsonSerializable()
class SyncChangeItemDataSealedSyncProfileData extends SyncChangeItemDataSealed
    implements SyncProfileData {
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final EncryptedEnvelope envelope;
  @override
  final ProfileKeyWrappers keyWrappers;
  @override
  final List<String>? recordIds;
  @override
  final List<String>? folderIds;
  @override
  final List<String>? collectionIds;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final SyncProfileDataResourceType resourceType;

  const SyncChangeItemDataSealedSyncProfileData({
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

  factory SyncChangeItemDataSealedSyncProfileData.fromJson(
    Map<String, dynamic> json,
  ) => _$SyncChangeItemDataSealedSyncProfileDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$SyncChangeItemDataSealedSyncProfileDataToJson(this);
}

@JsonSerializable()
class SyncChangeItemDataSealedSyncRecordData extends SyncChangeItemDataSealed
    implements SyncRecordData {
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final EncryptedEnvelope envelope;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final SyncRecordDataResourceType resourceType;

  const SyncChangeItemDataSealedSyncRecordData({
    required this.serverSequence,
    required this.editedAt,
    required this.envelope,
    required this.resourceId,
    required this.revision,
    required this.resourceType,
  });

  factory SyncChangeItemDataSealedSyncRecordData.fromJson(
    Map<String, dynamic> json,
  ) => _$SyncChangeItemDataSealedSyncRecordDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$SyncChangeItemDataSealedSyncRecordDataToJson(this);
}

@JsonSerializable()
class SyncChangeItemDataSealedSyncFolderData extends SyncChangeItemDataSealed
    implements SyncFolderData {
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final EncryptedEnvelope envelope;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final SyncFolderDataResourceType resourceType;

  const SyncChangeItemDataSealedSyncFolderData({
    required this.serverSequence,
    required this.editedAt,
    required this.envelope,
    required this.resourceId,
    required this.revision,
    required this.resourceType,
  });

  factory SyncChangeItemDataSealedSyncFolderData.fromJson(
    Map<String, dynamic> json,
  ) => _$SyncChangeItemDataSealedSyncFolderDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$SyncChangeItemDataSealedSyncFolderDataToJson(this);
}

@JsonSerializable()
class SyncChangeItemDataSealedSyncCollectionData
    extends SyncChangeItemDataSealed
    implements SyncCollectionData {
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final EncryptedEnvelope envelope;
  @override
  final int keyEpoch;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final SyncCollectionDataResourceType resourceType;

  const SyncChangeItemDataSealedSyncCollectionData({
    required this.serverSequence,
    required this.editedAt,
    required this.envelope,
    required this.keyEpoch,
    required this.resourceId,
    required this.revision,
    required this.resourceType,
  });

  factory SyncChangeItemDataSealedSyncCollectionData.fromJson(
    Map<String, dynamic> json,
  ) => _$SyncChangeItemDataSealedSyncCollectionDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$SyncChangeItemDataSealedSyncCollectionDataToJson(this);
}

@JsonSerializable()
class SyncChangeItemDataSealedSyncGrantData extends SyncChangeItemDataSealed
    implements SyncGrantData {
  @override
  final String collectionId;
  @override
  final RecipientEnvelope recipientKeyEnvelope;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final SyncGrantDataResourceType resourceType;

  const SyncChangeItemDataSealedSyncGrantData({
    required this.collectionId,
    required this.recipientKeyEnvelope,
    required this.resourceId,
    required this.revision,
    required this.resourceType,
  });

  factory SyncChangeItemDataSealedSyncGrantData.fromJson(
    Map<String, dynamic> json,
  ) => _$SyncChangeItemDataSealedSyncGrantDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$SyncChangeItemDataSealedSyncGrantDataToJson(this);
}
