// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'trash_folder_item_kind.dart';

part 'trash_folder_item.g.dart';

@JsonSerializable()
class TrashFolderItem {
  const TrashFolderItem({
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

  factory TrashFolderItem.fromJson(Map<String, Object?> json) =>
      _$TrashFolderItemFromJson(json);

  final String operationId;
  final String resourceId;
  final int revision;
  final int serverSequence;
  final DateTime editedAt;
  final DateTime deletedAt;
  final DateTime purgeAt;
  final EncryptedEnvelope envelope;
  final TrashFolderItemKind kind;

  Map<String, Object?> toJson() => _$TrashFolderItemToJson(this);
}
