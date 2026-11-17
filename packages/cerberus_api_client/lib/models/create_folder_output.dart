// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'create_folder_output.g.dart';

@JsonSerializable()
class CreateFolderOutput {
  const CreateFolderOutput({
    this.folderId,
    this.revision,
    this.serverSequence,
    this.editedAt,
  });

  factory CreateFolderOutput.fromJson(Map<String, Object?> json) =>
      _$CreateFolderOutputFromJson(json);

  final String? folderId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;

  Map<String, Object?> toJson() => _$CreateFolderOutputToJson(this);
}
