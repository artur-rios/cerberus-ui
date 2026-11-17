// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_export_profile_entry_type.dart';

part 'account_export_profile.g.dart';

@JsonSerializable()
class AccountExportProfile {
  const AccountExportProfile({
    required this.resourceId,
    required this.revision,
    required this.serverSequence,
    required this.editedAt,
    required this.deletedAt,
    required this.purgeAt,
    required this.envelope,
    required this.keyWrappers,
    required this.entryType,
  });

  factory AccountExportProfile.fromJson(Map<String, Object?> json) =>
      _$AccountExportProfileFromJson(json);

  final String resourceId;
  final int revision;
  final int serverSequence;
  final DateTime editedAt;
  final DateTime? deletedAt;
  final DateTime? purgeAt;
  final String? envelope;
  final String? keyWrappers;
  final AccountExportProfileEntryType entryType;

  Map<String, Object?> toJson() => _$AccountExportProfileToJson(this);
}
