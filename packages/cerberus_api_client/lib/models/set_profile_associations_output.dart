// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'set_profile_associations_output.g.dart';

@JsonSerializable()
class SetProfileAssociationsOutput {
  const SetProfileAssociationsOutput({
    this.profileId,
    this.revision,
    this.serverSequence,
    this.recordIds,
    this.folderIds,
    this.collectionIds,
  });

  factory SetProfileAssociationsOutput.fromJson(Map<String, Object?> json) =>
      _$SetProfileAssociationsOutputFromJson(json);

  final String? profileId;
  final int? revision;
  final int? serverSequence;
  final List<String>? recordIds;
  final List<String>? folderIds;
  final List<String>? collectionIds;

  Map<String, Object?> toJson() => _$SetProfileAssociationsOutputToJson(this);
}
