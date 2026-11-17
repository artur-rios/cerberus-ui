// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'grant_collection_access_output.g.dart';

@JsonSerializable()
class GrantCollectionAccessOutput {
  const GrantCollectionAccessOutput({
    this.collectionId,
    this.grantId,
    this.revision,
    this.access,
    this.recordIds,
    this.folderIds,
  });

  factory GrantCollectionAccessOutput.fromJson(Map<String, Object?> json) =>
      _$GrantCollectionAccessOutputFromJson(json);

  final String? collectionId;
  final String? grantId;
  final int? revision;
  final String? access;
  final List<String>? recordIds;
  final List<String>? folderIds;

  Map<String, Object?> toJson() => _$GrantCollectionAccessOutputToJson(this);
}
