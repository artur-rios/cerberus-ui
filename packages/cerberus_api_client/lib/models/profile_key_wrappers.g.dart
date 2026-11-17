// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_key_wrappers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileKeyWrappers _$ProfileKeyWrappersFromJson(Map<String, dynamic> json) =>
    ProfileKeyWrappers(
      unlockMode: json['unlockMode'] as String?,
      unlockVerifier: json['unlockVerifier'] == null
          ? null
          : PublicJwk.fromJson(json['unlockVerifier'] as Map<String, dynamic>),
      masterKeyWrapper: json['masterKeyWrapper'] == null
          ? null
          : RecipientEnvelope.fromJson(
              json['masterKeyWrapper'] as Map<String, dynamic>,
            ),
      passwordWrapper: json['passwordWrapper'] == null
          ? null
          : PasswordWrapper.fromJson(
              json['passwordWrapper'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProfileKeyWrappersToJson(ProfileKeyWrappers instance) =>
    <String, dynamic>{
      'unlockMode': instance.unlockMode,
      'unlockVerifier': instance.unlockVerifier,
      'masterKeyWrapper': instance.masterKeyWrapper,
      'passwordWrapper': instance.passwordWrapper,
    };
