// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'profile_key_wrappers.dart';
import 'trash_collection_item_kind.dart';
import 'trash_folder_item_kind.dart';
import 'trash_profile_item_kind.dart';
import 'trash_record_item_kind.dart';
import 'trash_record_item.dart';
import 'trash_folder_item.dart';
import 'trash_collection_item.dart';
import 'trash_profile_item.dart';

part 'trash_list_output_items_sealed.g.dart';

@JsonSerializable(createFactory: false)
sealed class TrashListOutputItemsSealed {
  const TrashListOutputItemsSealed();

  factory TrashListOutputItemsSealed.fromJson(Map<String, dynamic> json) =>
      TrashListOutputItemsSealedDeserializer.tryDeserialize(json);

  Map<String, dynamic> toJson();
}

extension TrashListOutputItemsSealedDeserializer on TrashListOutputItemsSealed {
  static TrashListOutputItemsSealed tryDeserialize(Map<String, dynamic> json) {
    try {
      return TrashListOutputItemsSealedTrashRecordItem.fromJson(json);
    } catch (_) {}
    try {
      return TrashListOutputItemsSealedTrashFolderItem.fromJson(json);
    } catch (_) {}
    try {
      return TrashListOutputItemsSealedTrashCollectionItem.fromJson(json);
    } catch (_) {}
    try {
      return TrashListOutputItemsSealedTrashProfileItem.fromJson(json);
    } catch (_) {}

    throw FormatException(
      'Could not determine the correct type for TrashListOutputItemsSealed from: $json',
    );
  }
}

@JsonSerializable()
class TrashListOutputItemsSealedTrashRecordItem
    extends TrashListOutputItemsSealed
    implements TrashRecordItem {
  @override
  final String operationId;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final DateTime deletedAt;
  @override
  final DateTime purgeAt;
  @override
  final EncryptedEnvelope envelope;
  @override
  final TrashRecordItemKind kind;

  const TrashListOutputItemsSealedTrashRecordItem({
    required this.operationId,
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.kind,
  });

  factory TrashListOutputItemsSealedTrashRecordItem.fromJson(
    Map<String, dynamic> json,
  ) => _$TrashListOutputItemsSealedTrashRecordItemFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$TrashListOutputItemsSealedTrashRecordItemToJson(this);
}

@JsonSerializable()
class TrashListOutputItemsSealedTrashFolderItem
    extends TrashListOutputItemsSealed
    implements TrashFolderItem {
  @override
  final String operationId;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final DateTime deletedAt;
  @override
  final DateTime purgeAt;
  @override
  final EncryptedEnvelope envelope;
  @override
  final TrashFolderItemKind kind;

  const TrashListOutputItemsSealedTrashFolderItem({
    required this.operationId,
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.kind,
  });

  factory TrashListOutputItemsSealedTrashFolderItem.fromJson(
    Map<String, dynamic> json,
  ) => _$TrashListOutputItemsSealedTrashFolderItemFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$TrashListOutputItemsSealedTrashFolderItemToJson(this);
}

@JsonSerializable()
class TrashListOutputItemsSealedTrashCollectionItem
    extends TrashListOutputItemsSealed
    implements TrashCollectionItem {
  @override
  final int keyEpoch;
  @override
  final String operationId;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final DateTime deletedAt;
  @override
  final DateTime purgeAt;
  @override
  final EncryptedEnvelope envelope;
  @override
  final TrashCollectionItemKind kind;

  const TrashListOutputItemsSealedTrashCollectionItem({
    required this.keyEpoch,
    required this.operationId,
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.kind,
  });

  factory TrashListOutputItemsSealedTrashCollectionItem.fromJson(
    Map<String, dynamic> json,
  ) => _$TrashListOutputItemsSealedTrashCollectionItemFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$TrashListOutputItemsSealedTrashCollectionItemToJson(this);
}

@JsonSerializable()
class TrashListOutputItemsSealedTrashProfileItem
    extends TrashListOutputItemsSealed
    implements TrashProfileItem {
  @override
  final ProfileKeyWrappers keyWrappers;
  @override
  final String operationId;
  @override
  final String resourceId;
  @override
  final int revision;
  @override
  final int serverSequence;
  @override
  final DateTime editedAt;
  @override
  final DateTime deletedAt;
  @override
  final DateTime purgeAt;
  @override
  final EncryptedEnvelope envelope;
  @override
  final TrashProfileItemKind kind;

  const TrashListOutputItemsSealedTrashProfileItem({
    required this.keyWrappers,
    required this.operationId,
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.kind,
  });

  factory TrashListOutputItemsSealedTrashProfileItem.fromJson(
    Map<String, dynamic> json,
  ) => _$TrashListOutputItemsSealedTrashProfileItemFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$TrashListOutputItemsSealedTrashProfileItemToJson(this);
}
