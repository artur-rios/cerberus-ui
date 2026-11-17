// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'set_collection_membership_output.g.dart';

@JsonSerializable()
class SetCollectionMembershipOutput {
  const SetCollectionMembershipOutput({
    this.collectionId,
    this.revision,
    this.serverSequence,
    this.editedAt,
    this.recordIds,
    this.folderIds,
  });

  factory SetCollectionMembershipOutput.fromJson(Map<String, Object?> json) =>
      _$SetCollectionMembershipOutputFromJson(json);

  final String? collectionId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;
  final List<String>? recordIds;
  final List<String>? folderIds;

  Map<String, Object?> toJson() => _$SetCollectionMembershipOutputToJson(this);
}
