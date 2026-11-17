// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'record_list_item.g.dart';

@JsonSerializable()
class RecordListItem {
  const RecordListItem({
    this.recordId,
    this.revision,
    this.serverSequence,
    this.editedAt,
    this.envelope,
  });

  factory RecordListItem.fromJson(Map<String, Object?> json) =>
      _$RecordListItemFromJson(json);

  final String? recordId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;
  final EncryptedEnvelope? envelope;

  Map<String, Object?> toJson() => _$RecordListItemToJson(this);
}
