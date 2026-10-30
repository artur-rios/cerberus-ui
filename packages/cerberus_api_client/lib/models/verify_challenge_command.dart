// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'verify_challenge_command.g.dart';

@JsonSerializable()
class VerifyChallengeCommand {
  const VerifyChallengeCommand({
    this.challengeToken,
    this.code,
    this.recoveryCode,
  });

  factory VerifyChallengeCommand.fromJson(Map<String, Object?> json) =>
      _$VerifyChallengeCommandFromJson(json);

  final String? challengeToken;
  final String? code;
  final String? recoveryCode;

  Map<String, Object?> toJson() => _$VerifyChallengeCommandToJson(this);
}
