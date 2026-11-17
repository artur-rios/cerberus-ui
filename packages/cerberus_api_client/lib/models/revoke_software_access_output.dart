// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'revoke_software_access_output.g.dart';

@JsonSerializable()
class RevokeSoftwareAccessOutput {
  const RevokeSoftwareAccessOutput({this.grantId, this.revision});

  factory RevokeSoftwareAccessOutput.fromJson(Map<String, Object?> json) =>
      _$RevokeSoftwareAccessOutputFromJson(json);

  final String? grantId;
  final int? revision;

  Map<String, Object?> toJson() => _$RevokeSoftwareAccessOutputToJson(this);
}
