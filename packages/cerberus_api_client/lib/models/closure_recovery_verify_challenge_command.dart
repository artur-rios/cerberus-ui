// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'closure_recovery_verify_challenge_command.g.dart';

@JsonSerializable()
class ClosureRecoveryVerifyChallengeCommand {
  const ClosureRecoveryVerifyChallengeCommand({
    required this.challengeToken,
    this.code,
    this.recoveryCode,
  });

  factory ClosureRecoveryVerifyChallengeCommand.fromJson(
    Map<String, Object?> json,
  ) => _$ClosureRecoveryVerifyChallengeCommandFromJson(json);

  final String? challengeToken;
  final String? code;
  final String? recoveryCode;

  Map<String, Object?> toJson() =>
      _$ClosureRecoveryVerifyChallengeCommandToJson(this);
}
