// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'revoke_collection_access_output.g.dart';

@JsonSerializable()
class RevokeCollectionAccessOutput {
  const RevokeCollectionAccessOutput({
    this.collectionId,
    this.grantId,
    this.revision,
  });

  factory RevokeCollectionAccessOutput.fromJson(Map<String, Object?> json) =>
      _$RevokeCollectionAccessOutputFromJson(json);

  final String? collectionId;
  final String? grantId;
  final int? revision;

  Map<String, Object?> toJson() => _$RevokeCollectionAccessOutputToJson(this);
}
