// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'account_export_input.g.dart';

@JsonSerializable()
class AccountExportInput {
  const AccountExportInput({required this.expectedRevision});

  factory AccountExportInput.fromJson(Map<String, Object?> json) =>
      _$AccountExportInputFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$AccountExportInputToJson(this);
}
