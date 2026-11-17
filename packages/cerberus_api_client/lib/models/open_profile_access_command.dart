// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'open_profile_access_command.g.dart';

@JsonSerializable()
class OpenProfileAccessCommand {
  const OpenProfileAccessCommand({required this.expectedRevision});

  factory OpenProfileAccessCommand.fromJson(Map<String, Object?> json) =>
      _$OpenProfileAccessCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$OpenProfileAccessCommandToJson(this);
}
