// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_profile_access_challenge_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueProfileAccessChallengeOutput _$IssueProfileAccessChallengeOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['challenge', 'profile'],
    disallowNullValues: const ['challenge', 'profile'],
  );
  return IssueProfileAccessChallengeOutput(
    challenge: json['challenge'] == null
        ? null
        : VaultProofChallenge.fromJson(
            json['challenge'] as Map<String, dynamic>,
          ),
    profile: json['profile'] == null
        ? null
        : ProfileAccessMaterial.fromJson(
            json['profile'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$IssueProfileAccessChallengeOutputToJson(
  IssueProfileAccessChallengeOutput instance,
) => <String, dynamic>{
  'challenge': ?instance.challenge?.toJson(),
  'profile': ?instance.profile?.toJson(),
};
