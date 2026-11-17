// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_edit_outcome_resource_kind.dart';
import 'sync_edit_outcome_status.dart';

part 'sync_edit_outcome.g.dart';

@JsonSerializable()
class SyncEditOutcome {
  const SyncEditOutcome({
    required this.operationId,
    required this.resourceKind,
    required this.resourceId,
    required this.status,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
  });

  factory SyncEditOutcome.fromJson(Map<String, Object?> json) =>
      _$SyncEditOutcomeFromJson(json);

  final String operationId;
  final SyncEditOutcomeResourceKind resourceKind;
  final String resourceId;
  final SyncEditOutcomeStatus status;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;

  Map<String, Object?> toJson() => _$SyncEditOutcomeToJson(this);
}
