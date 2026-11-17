// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'recipient_envelope.dart';

part 'grant_collection_access_command.g.dart';

@JsonSerializable()
class GrantCollectionAccessCommand {
  const GrantCollectionAccessCommand({
    required this.grantId,
    required this.recipientAccountId,
    required this.expectedRevision,
    required this.access,
    required this.keyEnvelope,
  });

  factory GrantCollectionAccessCommand.fromJson(Map<String, Object?> json) =>
      _$GrantCollectionAccessCommandFromJson(json);

  final String grantId;
  final String recipientAccountId;
  final int? expectedRevision;
  final String? access;
  final RecipientEnvelope keyEnvelope;

  Map<String, Object?> toJson() => _$GrantCollectionAccessCommandToJson(this);
}
