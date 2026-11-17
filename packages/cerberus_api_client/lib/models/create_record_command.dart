// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'create_record_command.g.dart';

@JsonSerializable()
class CreateRecordCommand {
  const CreateRecordCommand({
    required this.recordId,
    required this.envelope,
    required this.editedAt,
    required this.profileIds,
    this.folderId,
  });

  factory CreateRecordCommand.fromJson(Map<String, Object?> json) =>
      _$CreateRecordCommandFromJson(json);

  final String recordId;
  final EncryptedEnvelope envelope;
  final DateTime editedAt;
  final List<String>? profileIds;
  final String? folderId;

  Map<String, Object?> toJson() => _$CreateRecordCommandToJson(this);
}
