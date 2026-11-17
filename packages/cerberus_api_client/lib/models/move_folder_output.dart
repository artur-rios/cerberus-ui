// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'move_folder_output.g.dart';

@JsonSerializable()
class MoveFolderOutput {
  const MoveFolderOutput({
    this.folderId,
    this.parentFolderId,
    this.revision,
    this.serverSequence,
  });

  factory MoveFolderOutput.fromJson(Map<String, Object?> json) =>
      _$MoveFolderOutputFromJson(json);

  final String? folderId;
  final String? parentFolderId;
  final int? revision;
  final int? serverSequence;

  Map<String, Object?> toJson() => _$MoveFolderOutputToJson(this);
}
