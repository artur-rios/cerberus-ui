// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_folder_command.g.dart';

@JsonSerializable()
class DeleteFolderCommand {
  const DeleteFolderCommand({required this.expectedRevision});

  factory DeleteFolderCommand.fromJson(Map<String, Object?> json) =>
      _$DeleteFolderCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$DeleteFolderCommandToJson(this);
}
