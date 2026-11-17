// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum AccountExportSoftwareGrantEntryType {
  @JsonValue('software-grant')
  softwareGrant('software-grant'),

  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const AccountExportSoftwareGrantEntryType(this.json);

  factory AccountExportSoftwareGrantEntryType.fromJson(String json) =>
      values.firstWhere((e) => e.json == json, orElse: () => $unknown);

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();

  /// Returns all defined enum values excluding the $unknown value.
  static List<AccountExportSoftwareGrantEntryType> get $valuesDefined =>
      values.where((value) => value != $unknown).toList();
}
