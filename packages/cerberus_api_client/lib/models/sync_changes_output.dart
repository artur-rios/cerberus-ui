// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'sync_change_item.dart';

part 'sync_changes_output.g.dart';

@JsonSerializable()
class SyncChangesOutput {
  const SyncChangesOutput({
    this.accountId,
    this.profileId,
    this.policyRevision,
    this.revocationGeneration,
    this.serverTime,
    this.items,
    this.nextCursor,
    this.hasMore,
    this.clearScope,
    this.resynchronizationRequired,
  });

  factory SyncChangesOutput.fromJson(Map<String, Object?> json) =>
      _$SyncChangesOutputFromJson(json);

  final String? accountId;
  final String? profileId;
  final int? policyRevision;
  final int? revocationGeneration;
  final DateTime? serverTime;
  final List<SyncChangeItem>? items;
  final String? nextCursor;
  final bool? hasMore;
  final bool? clearScope;
  final bool? resynchronizationRequired;

  Map<String, Object?> toJson() => _$SyncChangesOutputToJson(this);
}
