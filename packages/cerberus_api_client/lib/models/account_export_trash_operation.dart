// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_trash_operation_entry_type.dart';
import 'account_export_trash_operation_root_kind.dart';

part 'account_export_trash_operation.g.dart';

@JsonSerializable()
class AccountExportTrashOperation {
  const AccountExportTrashOperation({
    required this.operationId,
    required this.rootKind,
    required this.rootId,
    required this.deletedAt,
    required this.purgeAt,
    required this.entryType,
  });

  factory AccountExportTrashOperation.fromJson(Map<String, Object?> json) =>
      _$AccountExportTrashOperationFromJson(json);

  final String operationId;
  final AccountExportTrashOperationRootKind rootKind;
  final String rootId;
  final DateTime deletedAt;
  final DateTime purgeAt;
  final AccountExportTrashOperationEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportTrashOperationToJson(this);
}
