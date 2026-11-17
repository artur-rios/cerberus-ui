// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum AccountExportSoftwareTargetResourceKind {
  @JsonValue('record')
  record('record'),
  @JsonValue('collection')
  collection('collection'),

  /// Default value for all unparsed values, allows backward compatibility when adding new values on the backend.
  $unknown(null);

  const AccountExportSoftwareTargetResourceKind(this.json);

  factory AccountExportSoftwareTargetResourceKind.fromJson(String json) =>
      values.firstWhere((e) => e.json == json, orElse: () => $unknown);

  final String? json;

  @override
  String toString() => json?.toString() ?? super.toString();

  /// Returns all defined enum values excluding the $unknown value.
  static List<AccountExportSoftwareTargetResourceKind> get $valuesDefined =>
      values.where((value) => value != $unknown).toList();
}
