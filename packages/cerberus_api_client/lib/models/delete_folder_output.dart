// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_folder_output.g.dart';

@JsonSerializable()
class DeleteFolderOutput {
  const DeleteFolderOutput({
    this.folderId,
    this.trashOperationId,
    this.revision,
    this.serverSequence,
    this.deletedAt,
    this.purgeAt,
  });

  factory DeleteFolderOutput.fromJson(Map<String, Object?> json) =>
      _$DeleteFolderOutputFromJson(json);

  final String? folderId;
  final String? trashOperationId;
  final int? revision;
  final int? serverSequence;
  final DateTime? deletedAt;
  final DateTime? purgeAt;

  Map<String, Object?> toJson() => _$DeleteFolderOutputToJson(this);
}
