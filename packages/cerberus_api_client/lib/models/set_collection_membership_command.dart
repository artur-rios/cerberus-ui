// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'set_collection_membership_command.g.dart';

@JsonSerializable()
class SetCollectionMembershipCommand {
  const SetCollectionMembershipCommand({
    required this.expectedRevision,
    required this.envelope,
    required this.editedAt,
    required this.recordIds,
    required this.folderIds,
  });

  factory SetCollectionMembershipCommand.fromJson(Map<String, Object?> json) =>
      _$SetCollectionMembershipCommandFromJson(json);

  final int expectedRevision;
  final EncryptedEnvelope envelope;
  final DateTime editedAt;
  final List<String>? recordIds;
  final List<String>? folderIds;

  Map<String, Object?> toJson() => _$SetCollectionMembershipCommandToJson(this);
}
