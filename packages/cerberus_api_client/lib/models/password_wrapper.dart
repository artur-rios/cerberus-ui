// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'password_kdf.dart';

part 'password_wrapper.g.dart';

@JsonSerializable()
class PasswordWrapper {
  const PasswordWrapper({
    this.format,
    this.keyEpoch,
    this.keySalt,
    this.nonce,
    this.ciphertext,
    this.tag,
    this.kdf,
  });

  factory PasswordWrapper.fromJson(Map<String, Object?> json) =>
      _$PasswordWrapperFromJson(json);

  final String? format;
  final int? keyEpoch;
  final String? keySalt;
  final String? nonce;
  final String? ciphertext;
  final String? tag;
  final PasswordKdf? kdf;

  Map<String, Object?> toJson() => _$PasswordWrapperToJson(this);
}
