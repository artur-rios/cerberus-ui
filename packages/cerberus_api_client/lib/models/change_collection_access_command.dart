// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'recipient_envelope.dart';

part 'change_collection_access_command.g.dart';

@JsonSerializable()
class ChangeCollectionAccessCommand {
  const ChangeCollectionAccessCommand({
    required this.expectedRevision,
    required this.access,
    required this.keyEnvelope,
  });

  factory ChangeCollectionAccessCommand.fromJson(Map<String, Object?> json) =>
      _$ChangeCollectionAccessCommandFromJson(json);

  final int expectedRevision;
  final String? access;
  final RecipientEnvelope keyEnvelope;

  Map<String, Object?> toJson() => _$ChangeCollectionAccessCommandToJson(this);
}
