// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'trash_list_item.g.dart';

@JsonSerializable()
class TrashListItem {
  const TrashListItem({
    required this.kind,
    this.operationId,
    this.resourceId,
    this.revision,
    this.serverSequence,
    this.editedAt,
    this.deletedAt,
    this.purgeAt,
    this.envelope,
  });

  factory TrashListItem.fromJson(Map<String, Object?> json) =>
      _$TrashListItemFromJson(json);

  final String kind;
  final String? operationId;
  final String? resourceId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;
  final DateTime? deletedAt;
  final DateTime? purgeAt;
  final EncryptedEnvelope? envelope;

  Map<String, Object?> toJson() => _$TrashListItemToJson(this);
}
