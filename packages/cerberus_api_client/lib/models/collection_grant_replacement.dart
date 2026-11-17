// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'recipient_envelope.dart';

part 'collection_grant_replacement.g.dart';

@JsonSerializable()
class CollectionGrantReplacement {
  const CollectionGrantReplacement({
    this.grantId,
    this.expectedRevision,
    this.keyEnvelope,
  });

  factory CollectionGrantReplacement.fromJson(Map<String, Object?> json) =>
      _$CollectionGrantReplacementFromJson(json);

  final String? grantId;
  final int? expectedRevision;
  final RecipientEnvelope? keyEnvelope;

  Map<String, Object?> toJson() => _$CollectionGrantReplacementToJson(this);
}
