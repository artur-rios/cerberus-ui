// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'update_collection_command.g.dart';

@JsonSerializable()
class UpdateCollectionCommand {
  const UpdateCollectionCommand({
    required this.expectedRevision,
    required this.envelope,
    required this.editedAt,
  });

  factory UpdateCollectionCommand.fromJson(Map<String, Object?> json) =>
      _$UpdateCollectionCommandFromJson(json);

  final int expectedRevision;
  final EncryptedEnvelope envelope;
  final DateTime editedAt;

  Map<String, Object?> toJson() => _$UpdateCollectionCommandToJson(this);
}
