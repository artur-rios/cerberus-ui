// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'issue_vault_challenge_command.g.dart';

@JsonSerializable()
class IssueVaultChallengeCommand {
  const IssueVaultChallengeCommand({this.operation, this.requestHash});

  factory IssueVaultChallengeCommand.fromJson(Map<String, Object?> json) =>
      _$IssueVaultChallengeCommandFromJson(json);

  final String? operation;
  final String? requestHash;

  Map<String, Object?> toJson() => _$IssueVaultChallengeCommandToJson(this);
}
