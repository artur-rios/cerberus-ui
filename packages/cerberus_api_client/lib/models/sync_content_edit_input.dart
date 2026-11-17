// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'sync_content_edit_input.g.dart';

@JsonSerializable()
class SyncContentEditInput {
  const SyncContentEditInput({
    required this.resourceId,
    required this.envelope,
    required this.editedAt,
  });

  factory SyncContentEditInput.fromJson(Map<String, Object?> json) =>
      _$SyncContentEditInputFromJson(json);

  final String resourceId;
  final EncryptedEnvelope envelope;
  final DateTime editedAt;

  Map<String, Object?> toJson() => _$SyncContentEditInputToJson(this);
}
