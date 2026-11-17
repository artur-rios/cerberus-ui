// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'set_profile_associations_command.g.dart';

@JsonSerializable()
class SetProfileAssociationsCommand {
  const SetProfileAssociationsCommand({
    required this.expectedRevision,
    required this.recordIds,
    required this.folderIds,
    required this.collectionIds,
  });

  factory SetProfileAssociationsCommand.fromJson(Map<String, Object?> json) =>
      _$SetProfileAssociationsCommandFromJson(json);

  final int expectedRevision;
  final List<String>? recordIds;
  final List<String>? folderIds;
  final List<String>? collectionIds;

  Map<String, Object?> toJson() => _$SetProfileAssociationsCommandToJson(this);
}
