// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'folder_create_input.g.dart';

@JsonSerializable()
class FolderCreateInput {
  const FolderCreateInput({
    required this.folderId,
    required this.envelope,
    required this.editedAt,
    required this.profileIds,
    this.parentFolderId,
  });

  factory FolderCreateInput.fromJson(Map<String, Object?> json) =>
      _$FolderCreateInputFromJson(json);

  final String folderId;
  final EncryptedEnvelope envelope;
  final DateTime editedAt;
  final List<String>? profileIds;
  final String? parentFolderId;

  Map<String, Object?> toJson() => _$FolderCreateInputToJson(this);
}
