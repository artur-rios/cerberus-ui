// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'vault_proof_challenge.g.dart';

@JsonSerializable()
class VaultProofChallenge {
  const VaultProofChallenge({
    this.format,
    this.challengeId,
    this.nonce,
    this.operation,
    this.identityId,
    this.accountId,
    this.scopeKind,
    this.scopeId,
    this.keyEpoch,
    this.protectionRevision,
    this.generation,
    this.requestHash,
    this.issuedAt,
    this.expiresAt,
  });

  factory VaultProofChallenge.fromJson(Map<String, Object?> json) =>
      _$VaultProofChallengeFromJson(json);

  final String? format;
  final String? challengeId;
  final String? nonce;
  final String? operation;
  final String? identityId;
  final String? accountId;
  final String? scopeKind;
  final String? scopeId;
  final int? keyEpoch;
  final int? protectionRevision;
  final int? generation;
  final String? requestHash;
  final int? issuedAt;
  final int? expiresAt;

  Map<String, Object?> toJson() => _$VaultProofChallengeToJson(this);
}
