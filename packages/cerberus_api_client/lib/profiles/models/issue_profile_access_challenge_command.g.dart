// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_profile_access_challenge_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueProfileAccessChallengeCommand _$IssueProfileAccessChallengeCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'requestHash'],
    requiredKeys: const ['expectedRevision', 'requestHash'],
    disallowNullValues: const ['expectedRevision'],
  );
  return IssueProfileAccessChallengeCommand(
    expectedRevision: IssueProfileAccessChallengeCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    requestHash: json['requestHash'] as String?,
  );
}

Map<String, dynamic> _$IssueProfileAccessChallengeCommandToJson(
  IssueProfileAccessChallengeCommand instance,
) => <String, dynamic>{
  'expectedRevision':
      ?IssueProfileAccessChallengeCommand._write_expectedRevision(
        instance.expectedRevision,
      ),
  'requestHash': instance.requestHash,
};
