// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_profile_output.g.dart';

@JsonSerializable()
class DeleteProfileOutput {
  const DeleteProfileOutput({
    this.profileId,
    this.trashOperationId,
    this.revision,
    this.serverSequence,
    this.deletedAt,
    this.purgeAt,
  });

  factory DeleteProfileOutput.fromJson(Map<String, Object?> json) =>
      _$DeleteProfileOutputFromJson(json);

  final String? profileId;
  final String? trashOperationId;
  final int? revision;
  final int? serverSequence;
  final DateTime? deletedAt;
  final DateTime? purgeAt;

  Map<String, Object?> toJson() => _$DeleteProfileOutputToJson(this);
}
