// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'profile_key_wrappers.dart';

part 'profile_list_item.g.dart';

@JsonSerializable()
class ProfileListItem {
  const ProfileListItem({
    this.profileId,
    this.revision,
    this.serverSequence,
    this.editedAt,
    this.envelope,
    this.keyWrappers,
    this.recordIds,
    this.folderIds,
    this.collectionIds,
  });

  factory ProfileListItem.fromJson(Map<String, Object?> json) =>
      _$ProfileListItemFromJson(json);

  final String? profileId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;
  final EncryptedEnvelope? envelope;
  final ProfileKeyWrappers? keyWrappers;
  final List<String>? recordIds;
  final List<String>? folderIds;
  final List<String>? collectionIds;

  Map<String, Object?> toJson() => _$ProfileListItemToJson(this);
}
