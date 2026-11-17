// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'profile_key_wrappers.dart';
import 'trash_profile_item_kind.dart';

part 'trash_profile_item.g.dart';

@JsonSerializable()
class TrashProfileItem {
  const TrashProfileItem({
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

  factory TrashProfileItem.fromJson(Map<String, Object?> json) =>
      _$TrashProfileItemFromJson(json);

  final ProfileKeyWrappers keyWrappers;
  final String operationId;
  final String resourceId;
  final int revision;
  final int serverSequence;
  final DateTime editedAt;
  final DateTime deletedAt;
  final DateTime purgeAt;
  final EncryptedEnvelope envelope;
  final TrashProfileItemKind kind;

  Map<String, Object?> toJson() => _$TrashProfileItemToJson(this);
}
