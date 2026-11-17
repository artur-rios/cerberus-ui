// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'move_folder_command.g.dart';

@JsonSerializable()
class MoveFolderCommand {
  const MoveFolderCommand({
    required this.expectedRevision,
    required this.parentFolderId,
  });

  factory MoveFolderCommand.fromJson(Map<String, Object?> json) =>
      _$MoveFolderCommandFromJson(json);

  final int expectedRevision;
  final String? parentFolderId;

  Map<String, Object?> toJson() => _$MoveFolderCommandToJson(this);
}
