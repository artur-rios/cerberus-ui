// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_challenge_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyChallengeCommand _$VerifyChallengeCommandFromJson(
  Map<String, dynamic> json,
) => VerifyChallengeCommand(
  challengeToken: json['challengeToken'] as String?,
  code: json['code'] as String?,
  recoveryCode: json['recoveryCode'] as String?,
);

Map<String, dynamic> _$VerifyChallengeCommandToJson(
  VerifyChallengeCommand instance,
) => <String, dynamic>{
  'challengeToken': instance.challengeToken,
  'code': instance.code,
  'recoveryCode': instance.recoveryCode,
};
