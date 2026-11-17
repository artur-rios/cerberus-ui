// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'collection_list_item.g.dart';

@JsonSerializable()
class CollectionListItem {
  const CollectionListItem({
    this.collectionId,
    this.revision,
    this.serverSequence,
    this.editedAt,
    this.envelope,
  });

  factory CollectionListItem.fromJson(Map<String, Object?> json) =>
      _$CollectionListItemFromJson(json);

  final String? collectionId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;
  final EncryptedEnvelope? envelope;

  Map<String, Object?> toJson() => _$CollectionListItemToJson(this);
}
