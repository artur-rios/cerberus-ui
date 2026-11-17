// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'empty_trash_command.g.dart';

@JsonSerializable()
class EmptyTrashCommand {
  const EmptyTrashCommand({required this.expectedRevision});

  factory EmptyTrashCommand.fromJson(Map<String, Object?> json) =>
      _$EmptyTrashCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$EmptyTrashCommandToJson(this);
}
