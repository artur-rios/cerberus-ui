// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_edit_outcome.dart';

part 'sync_edits_output.g.dart';

@JsonSerializable()
class SyncEditsOutput {
  const SyncEditsOutput({
    this.accountId,
    this.profileId,
    this.serverTime,
    this.outcomes,
  });

  factory SyncEditsOutput.fromJson(Map<String, Object?> json) =>
      _$SyncEditsOutputFromJson(json);

  final String? accountId;
  final String? profileId;
  final DateTime? serverTime;
  final List<SyncEditOutcome>? outcomes;

  Map<String, Object?> toJson() => _$SyncEditsOutputToJson(this);
}
