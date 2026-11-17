// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_shared_reference_access.dart';
import 'account_export_shared_reference_entry_type.dart';

part 'account_export_shared_reference.g.dart';

@JsonSerializable()
class AccountExportSharedReference {
  const AccountExportSharedReference({
    required this.collectionId,
    required this.ownerAccountId,
    required this.grantId,
    required this.grantRevision,
    required this.access,
    required this.entryType,
  });

  factory AccountExportSharedReference.fromJson(Map<String, Object?> json) =>
      _$AccountExportSharedReferenceFromJson(json);

  final String collectionId;
  final String ownerAccountId;
  final String grantId;
  final int grantRevision;
  final AccountExportSharedReferenceAccess access;
  final AccountExportSharedReferenceEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportSharedReferenceToJson(this);
}
