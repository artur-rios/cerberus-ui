// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'grant_software_access_output.g.dart';

@JsonSerializable()
class GrantSoftwareAccessOutput {
  const GrantSoftwareAccessOutput({this.grantId, this.revision});

  factory GrantSoftwareAccessOutput.fromJson(Map<String, Object?> json) =>
      _$GrantSoftwareAccessOutputFromJson(json);

  final String? grantId;
  final int? revision;

  Map<String, Object?> toJson() => _$GrantSoftwareAccessOutputToJson(this);
}
