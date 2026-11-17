// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'collection_details_output.g.dart';

@JsonSerializable()
class CollectionDetailsOutput {
  const CollectionDetailsOutput({
    required this.envelope,
    this.collectionId,
    this.revision,
    this.serverSequence,
    this.editedAt,
    this.profileIds,
    this.recordIds,
    this.folderIds,
  });

  factory CollectionDetailsOutput.fromJson(Map<String, Object?> json) =>
      _$CollectionDetailsOutputFromJson(json);

  final String? collectionId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;
  final EncryptedEnvelope envelope;
  final List<String>? profileIds;
  final List<String>? recordIds;
  final List<String>? folderIds;

  Map<String, Object?> toJson() => _$CollectionDetailsOutputToJson(this);
}
