// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'profile_key_wrappers.dart';

part 'profile_create_input.g.dart';

@JsonSerializable()
class ProfileCreateInput {
  const ProfileCreateInput({
    this.profileId,
    this.envelope,
    this.keyWrappers,
    this.editedAt,
    this.recordIds,
    this.folderIds,
    this.collectionIds,
  });

  factory ProfileCreateInput.fromJson(Map<String, Object?> json) =>
      _$ProfileCreateInputFromJson(json);

  final String? profileId;
  final EncryptedEnvelope? envelope;
  final ProfileKeyWrappers? keyWrappers;
  final DateTime? editedAt;
  final List<String>? recordIds;
  final List<String>? folderIds;
  final List<String>? collectionIds;

  Map<String, Object?> toJson() => _$ProfileCreateInputToJson(this);
}
