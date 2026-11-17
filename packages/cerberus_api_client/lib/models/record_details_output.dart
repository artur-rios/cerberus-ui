// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'record_details_output.g.dart';

@JsonSerializable()
class RecordDetailsOutput {
  const RecordDetailsOutput({
    required this.envelope,
    this.recordId,
    this.revision,
    this.serverSequence,
    this.editedAt,
    this.profileIds,
    this.folderId,
    this.collectionIds,
  });

  factory RecordDetailsOutput.fromJson(Map<String, Object?> json) =>
      _$RecordDetailsOutputFromJson(json);

  final String? recordId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;
  final EncryptedEnvelope envelope;
  final List<String>? profileIds;
  final String? folderId;
  final List<String>? collectionIds;

  Map<String, Object?> toJson() => _$RecordDetailsOutputToJson(this);
}
