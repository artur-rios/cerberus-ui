// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'recovery_wrapper.g.dart';

@JsonSerializable()
class RecoveryWrapper {
  const RecoveryWrapper({
    this.format,
    this.keyEpoch,
    this.keySalt,
    this.nonce,
    this.ciphertext,
    this.tag,
    this.generation,
    this.proofKeyFingerprint,
  });

  factory RecoveryWrapper.fromJson(Map<String, Object?> json) =>
      _$RecoveryWrapperFromJson(json);

  final String? format;
  final int? keyEpoch;
  final String? keySalt;
  final String? nonce;
  final String? ciphertext;
  final String? tag;
  final int? generation;
  final String? proofKeyFingerprint;

  Map<String, Object?> toJson() => _$RecoveryWrapperToJson(this);
}
