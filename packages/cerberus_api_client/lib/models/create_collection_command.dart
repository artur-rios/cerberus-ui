// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'create_collection_command.g.dart';

@JsonSerializable()
class CreateCollectionCommand {
  const CreateCollectionCommand({
    required this.collectionId,
    required this.envelope,
    required this.editedAt,
    required this.profileIds,
    required this.recordIds,
    required this.folderIds,
  });

  factory CreateCollectionCommand.fromJson(Map<String, Object?> json) =>
      _$CreateCollectionCommandFromJson(json);

  final String collectionId;
  final EncryptedEnvelope envelope;
  final DateTime editedAt;
  final List<String>? profileIds;
  final List<String>? recordIds;
  final List<String>? folderIds;

  Map<String, Object?> toJson() => _$CreateCollectionCommandToJson(this);
}
