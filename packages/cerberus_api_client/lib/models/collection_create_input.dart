// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'collection_create_input.g.dart';

@JsonSerializable()
class CollectionCreateInput {
  const CollectionCreateInput({
    required this.collectionId,
    required this.envelope,
    required this.editedAt,
    required this.profileIds,
    required this.recordIds,
    required this.folderIds,
  });

  factory CollectionCreateInput.fromJson(Map<String, Object?> json) =>
      _$CollectionCreateInputFromJson(json);

  final String collectionId;
  final EncryptedEnvelope envelope;
  final DateTime editedAt;
  final List<String>? profileIds;
  final List<String>? recordIds;
  final List<String>? folderIds;

  Map<String, Object?> toJson() => _$CollectionCreateInputToJson(this);
}
