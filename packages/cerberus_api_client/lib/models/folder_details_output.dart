// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'folder_details_output.g.dart';

@JsonSerializable()
class FolderDetailsOutput {
  const FolderDetailsOutput({
    required this.envelope,
    this.folderId,
    this.revision,
    this.serverSequence,
    this.editedAt,
    this.profileIds,
    this.parentFolderId,
    this.collectionIds,
  });

  factory FolderDetailsOutput.fromJson(Map<String, Object?> json) =>
      _$FolderDetailsOutputFromJson(json);

  final String? folderId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;
  final EncryptedEnvelope envelope;
  final List<String>? profileIds;
  final String? parentFolderId;
  final List<String>? collectionIds;

  Map<String, Object?> toJson() => _$FolderDetailsOutputToJson(this);
}
