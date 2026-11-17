// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_vault_challenge_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueVaultChallengeCommand _$IssueVaultChallengeCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(json, allowedKeys: const ['operation', 'requestHash']);
  return IssueVaultChallengeCommand(
    operation: json['operation'] as String?,
    requestHash: json['requestHash'] as String?,
  );
}

Map<String, dynamic> _$IssueVaultChallengeCommandToJson(
  IssueVaultChallengeCommand instance,
) => <String, dynamic>{
  'operation': ?instance.operation,
  'requestHash': ?instance.requestHash,
};
