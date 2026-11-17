// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'trash_purged_count.dart';

part 'empty_trash_output.g.dart';

@JsonSerializable()
class EmptyTrashOutput {
  const EmptyTrashOutput({
    required this.accountId,
    required this.purgedAt,
    required this.counts,
    required this.totalPurged,
  });

  factory EmptyTrashOutput.fromJson(Map<String, Object?> json) =>
      _$EmptyTrashOutputFromJson(json);

  final String accountId;
  final DateTime purgedAt;
  final List<TrashPurgedCount> counts;
  final int totalPurged;

  Map<String, Object?> toJson() => _$EmptyTrashOutputToJson(this);
}
