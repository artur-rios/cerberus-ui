// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'revoke_software_access_command.g.dart';

@JsonSerializable()
class RevokeSoftwareAccessCommand {
  const RevokeSoftwareAccessCommand({required this.expectedRevision});

  factory RevokeSoftwareAccessCommand.fromJson(Map<String, Object?> json) =>
      _$RevokeSoftwareAccessCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$RevokeSoftwareAccessCommandToJson(this);
}
