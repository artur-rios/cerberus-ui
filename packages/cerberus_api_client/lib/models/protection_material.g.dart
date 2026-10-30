// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'protection_material.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProtectionMaterial _$ProtectionMaterialFromJson(Map<String, dynamic> json) =>
    ProtectionMaterial(
      passwordWrapper: json['passwordWrapper'] == null
          ? null
          : PasswordWrapper.fromJson(
              json['passwordWrapper'] as Map<String, dynamic>,
            ),
      recoveryWrapper: json['recoveryWrapper'] == null
          ? null
          : RecoveryWrapper.fromJson(
              json['recoveryWrapper'] as Map<String, dynamic>,
            ),
      unlockVerifier: json['unlockVerifier'] == null
          ? null
          : PublicJwk.fromJson(json['unlockVerifier'] as Map<String, dynamic>),
      recoveryVerifier: json['recoveryVerifier'] == null
          ? null
          : PublicJwk.fromJson(
              json['recoveryVerifier'] as Map<String, dynamic>,
            ),
      recipientKey: json['recipientKey'] == null
          ? null
          : PublicJwk.fromJson(json['recipientKey'] as Map<String, dynamic>),
      authorKey: json['authorKey'] == null
          ? null
          : PublicJwk.fromJson(json['authorKey'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProtectionMaterialToJson(ProtectionMaterial instance) =>
    <String, dynamic>{
      'passwordWrapper': instance.passwordWrapper,
      'recoveryWrapper': instance.recoveryWrapper,
      'unlockVerifier': instance.unlockVerifier,
      'recoveryVerifier': instance.recoveryVerifier,
      'recipientKey': instance.recipientKey,
      'authorKey': instance.authorKey,
    };
