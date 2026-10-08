// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'vault_proof_challenge.dart';

part 'vault_challenge_output.g.dart';

@JsonSerializable()
class VaultChallengeOutput {
  const VaultChallengeOutput({required this.challenge});

  factory VaultChallengeOutput.fromJson(Map<String, Object?> json) =>
      _$VaultChallengeOutputFromJson(json);

  final VaultProofChallenge challenge;

  Map<String, Object?> toJson() => _$VaultChallengeOutputToJson(this);
}
