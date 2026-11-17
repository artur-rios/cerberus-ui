// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'restore_trash_command.g.dart';

@JsonSerializable()
class RestoreTrashCommand {
  const RestoreTrashCommand({required this.expectedRevision});

  factory RestoreTrashCommand.fromJson(Map<String, Object?> json) =>
      _$RestoreTrashCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$RestoreTrashCommandToJson(this);
}
