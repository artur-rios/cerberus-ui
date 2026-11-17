// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'issue_profile_access_challenge_command.g.dart';

@JsonSerializable()
class IssueProfileAccessChallengeCommand {
  const IssueProfileAccessChallengeCommand({
    required this.expectedRevision,
    required this.requestHash,
  });

  factory IssueProfileAccessChallengeCommand.fromJson(
    Map<String, Object?> json,
  ) => _$IssueProfileAccessChallengeCommandFromJson(json);

  final int expectedRevision;
  final String? requestHash;

  Map<String, Object?> toJson() =>
      _$IssueProfileAccessChallengeCommandToJson(this);
}
