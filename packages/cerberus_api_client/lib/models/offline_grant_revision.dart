// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'offline_grant_revision.g.dart';

@JsonSerializable()
class OfflineGrantRevision {
  const OfflineGrantRevision({this.grantId, this.revision});

  factory OfflineGrantRevision.fromJson(Map<String, Object?> json) =>
      _$OfflineGrantRevisionFromJson(json);

  final String? grantId;
  final int? revision;

  Map<String, Object?> toJson() => _$OfflineGrantRevisionToJson(this);
}
