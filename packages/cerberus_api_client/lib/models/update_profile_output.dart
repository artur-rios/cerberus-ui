// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'update_profile_output.g.dart';

@JsonSerializable()
class UpdateProfileOutput {
  const UpdateProfileOutput({
    this.profileId,
    this.revision,
    this.serverSequence,
    this.editedAt,
  });

  factory UpdateProfileOutput.fromJson(Map<String, Object?> json) =>
      _$UpdateProfileOutputFromJson(json);

  final String? profileId;
  final int? revision;
  final int? serverSequence;
  final DateTime? editedAt;

  Map<String, Object?> toJson() => _$UpdateProfileOutputToJson(this);
}
