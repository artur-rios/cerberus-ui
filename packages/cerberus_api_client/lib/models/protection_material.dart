// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'password_wrapper.dart';
import 'public_jwk.dart';
import 'recovery_wrapper.dart';

part 'protection_material.g.dart';

@JsonSerializable()
class ProtectionMaterial {
  const ProtectionMaterial({
    this.passwordWrapper,
    this.recoveryWrapper,
    this.unlockVerifier,
    this.recoveryVerifier,
    this.recipientKey,
    this.authorKey,
  });

  factory ProtectionMaterial.fromJson(Map<String, Object?> json) =>
      _$ProtectionMaterialFromJson(json);

  final PasswordWrapper? passwordWrapper;
  final RecoveryWrapper? recoveryWrapper;
  final PublicJwk? unlockVerifier;
  final PublicJwk? recoveryVerifier;
  final PublicJwk? recipientKey;
  final PublicJwk? authorKey;

  Map<String, Object?> toJson() => _$ProtectionMaterialToJson(this);
}
