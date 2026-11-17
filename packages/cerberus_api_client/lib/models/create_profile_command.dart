// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'profile_key_wrappers.dart';

part 'create_profile_command.g.dart';

@JsonSerializable()
class CreateProfileCommand {
  const CreateProfileCommand({
    this.profileId,
    this.envelope,
    this.keyWrappers,
    this.editedAt,
    this.recordIds,
    this.folderIds,
    this.collectionIds,
  });

  factory CreateProfileCommand.fromJson(Map<String, Object?> json) =>
      _$CreateProfileCommandFromJson(json);

  final String? profileId;
  final EncryptedEnvelope? envelope;
  final ProfileKeyWrappers? keyWrappers;
  final DateTime? editedAt;
  final List<String>? recordIds;
  final List<String>? folderIds;
  final List<String>? collectionIds;

  Map<String, Object?> toJson() => _$CreateProfileCommandToJson(this);
}
