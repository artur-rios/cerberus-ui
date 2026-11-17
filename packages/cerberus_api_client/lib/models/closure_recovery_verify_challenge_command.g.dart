// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closure_recovery_verify_challenge_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClosureRecoveryVerifyChallengeCommand
_$ClosureRecoveryVerifyChallengeCommandFromJson(Map<String, dynamic> json) =>
    ClosureRecoveryVerifyChallengeCommand(
      challengeToken: json['challengeToken'] as String?,
      code: json['code'] as String?,
      recoveryCode: json['recoveryCode'] as String?,
    );

Map<String, dynamic> _$ClosureRecoveryVerifyChallengeCommandToJson(
  ClosureRecoveryVerifyChallengeCommand instance,
) => <String, dynamic>{
  'challengeToken': instance.challengeToken,
  'code': instance.code,
  'recoveryCode': instance.recoveryCode,
};
