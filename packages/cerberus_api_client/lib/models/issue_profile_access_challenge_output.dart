// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'profile_access_material.dart';
import 'vault_proof_challenge.dart';

part 'issue_profile_access_challenge_output.g.dart';

@JsonSerializable()
class IssueProfileAccessChallengeOutput {
  const IssueProfileAccessChallengeOutput({this.challenge, this.profile});

  factory IssueProfileAccessChallengeOutput.fromJson(
    Map<String, Object?> json,
  ) => _$IssueProfileAccessChallengeOutputFromJson(json);

  final VaultProofChallenge? challenge;
  final ProfileAccessMaterial? profile;

  Map<String, Object?> toJson() =>
      _$IssueProfileAccessChallengeOutputToJson(this);
}
