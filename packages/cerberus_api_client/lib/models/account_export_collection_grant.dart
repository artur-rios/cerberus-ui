// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_collection_grant_access.dart';
import 'account_export_collection_grant_entry_type.dart';
import 'account_export_collection_grant_state.dart';

part 'account_export_collection_grant.g.dart';

@JsonSerializable()
class AccountExportCollectionGrant {
  const AccountExportCollectionGrant({
    required this.grantId,
    required this.collectionId,
    required this.recipientAccountId,
    required this.access,
    required this.state,
    required this.revision,
    required this.recipientKeyEnvelope,
    required this.entryType,
  });

  factory AccountExportCollectionGrant.fromJson(Map<String, Object?> json) =>
      _$AccountExportCollectionGrantFromJson(json);

  final String grantId;
  final String collectionId;
  final String recipientAccountId;
  final AccountExportCollectionGrantAccess access;
  final AccountExportCollectionGrantState state;
  final int revision;
  final String? recipientKeyEnvelope;
  final AccountExportCollectionGrantEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportCollectionGrantToJson(this);
}
