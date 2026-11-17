// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_profile_access_challenge_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueProfileAccessChallengeCommand _$IssueProfileAccessChallengeCommandFromJson(
  Map<String, dynamic> json,
) => IssueProfileAccessChallengeCommand(
  expectedRevision: (json['expectedRevision'] as num).toInt(),
  requestHash: json['requestHash'] as String?,
);

Map<String, dynamic> _$IssueProfileAccessChallengeCommandToJson(
  IssueProfileAccessChallengeCommand instance,
) => <String, dynamic>{
  'expectedRevision': instance.expectedRevision,
  'requestHash': instance.requestHash,
};
