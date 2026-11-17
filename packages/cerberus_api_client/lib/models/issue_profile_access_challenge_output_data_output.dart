// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'issue_profile_access_challenge_output.dart';

part 'issue_profile_access_challenge_output_data_output.g.dart';

@JsonSerializable()
class IssueProfileAccessChallengeOutputDataOutput {
  const IssueProfileAccessChallengeOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory IssueProfileAccessChallengeOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$IssueProfileAccessChallengeOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final IssueProfileAccessChallengeOutput? data;

  Map<String, Object?> toJson() =>
      _$IssueProfileAccessChallengeOutputDataOutputToJson(this);
}
