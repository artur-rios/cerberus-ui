// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'recipient_envelope.g.dart';

@JsonSerializable()
class RecipientEnvelope {
  const RecipientEnvelope({
    this.format,
    this.keyEpoch,
    this.grantId,
    this.grantRevision,
    this.recipientIdentityId,
    this.recipientKeyFingerprint,
    this.authorKeyFingerprint,
    this.enc,
    this.ciphertext,
    this.signature,
  });

  factory RecipientEnvelope.fromJson(Map<String, Object?> json) =>
      _$RecipientEnvelopeFromJson(json);

  final String? format;
  final int? keyEpoch;
  final String? grantId;
  final int? grantRevision;
  final String? recipientIdentityId;
  final String? recipientKeyFingerprint;
  final String? authorKeyFingerprint;
  final String? enc;
  final String? ciphertext;
  final String? signature;

  Map<String, Object?> toJson() => _$RecipientEnvelopeToJson(this);
}
