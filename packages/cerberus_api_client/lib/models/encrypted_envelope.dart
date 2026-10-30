// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'encrypted_envelope.g.dart';

@JsonSerializable()
class EncryptedEnvelope {
  const EncryptedEnvelope({
    this.format,
    this.keyEpoch,
    this.keySalt,
    this.nonce,
    this.ciphertext,
    this.tag,
  });

  factory EncryptedEnvelope.fromJson(Map<String, Object?> json) =>
      _$EncryptedEnvelopeFromJson(json);

  final String? format;
  final int? keyEpoch;
  final String? keySalt;
  final String? nonce;
  final String? ciphertext;
  final String? tag;

  Map<String, Object?> toJson() => _$EncryptedEnvelopeToJson(this);
}
