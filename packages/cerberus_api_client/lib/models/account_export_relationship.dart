// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_relationship_entry_type.dart';
import 'account_export_relationship_relationship_kind.dart';
import 'account_export_relationship_source_kind.dart';
import 'account_export_relationship_target_kind.dart';

part 'account_export_relationship.g.dart';

@JsonSerializable()
class AccountExportRelationship {
  const AccountExportRelationship({
    required this.relationshipKind,
    required this.sourceKind,
    required this.sourceId,
    required this.targetKind,
    required this.targetId,
    required this.operationId,
    required this.entryType,
  });

  factory AccountExportRelationship.fromJson(Map<String, Object?> json) =>
      _$AccountExportRelationshipFromJson(json);

  final AccountExportRelationshipRelationshipKind relationshipKind;
  final AccountExportRelationshipSourceKind sourceKind;
  final String sourceId;
  final AccountExportRelationshipTargetKind targetKind;
  final String targetId;
  final String? operationId;
  final AccountExportRelationshipEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportRelationshipToJson(this);
}
