// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_profile_command.g.dart';

@JsonSerializable()
class DeleteProfileCommand {
  const DeleteProfileCommand({this.expectedRevision});

  factory DeleteProfileCommand.fromJson(Map<String, Object?> json) =>
      _$DeleteProfileCommandFromJson(json);

  final int? expectedRevision;

  Map<String, Object?> toJson() => _$DeleteProfileCommandToJson(this);
}
