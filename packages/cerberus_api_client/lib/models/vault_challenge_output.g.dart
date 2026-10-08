// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_challenge_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultChallengeOutput _$VaultChallengeOutputFromJson(
  Map<String, dynamic> json,
) => VaultChallengeOutput(
  challenge: VaultProofChallenge.fromJson(
    json['challenge'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$VaultChallengeOutputToJson(
  VaultChallengeOutput instance,
) => <String, dynamic>{'challenge': instance.challenge};
