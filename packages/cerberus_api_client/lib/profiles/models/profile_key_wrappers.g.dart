// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_key_wrappers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileKeyWrappers _$ProfileKeyWrappersFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'unlockMode',
      'unlockVerifier',
      'masterKeyWrapper',
      'passwordWrapper',
    ],
    disallowNullValues: const ['unlockVerifier', 'masterKeyWrapper'],
  );
  return ProfileKeyWrappers(
    unlockMode: json['unlockMode'] as String?,
    unlockVerifier: json['unlockVerifier'] == null
        ? null
        : PublicJwk.fromJson(json['unlockVerifier'] as Map<String, dynamic>),
    masterKeyWrapper: json['masterKeyWrapper'] == null
        ? null
        : RecipientEnvelope.fromJson(
            json['masterKeyWrapper'] as Map<String, dynamic>,
          ),
    passwordWrapper: !json.containsKey('passwordWrapper')
        ? null
        : ProfileKeyWrappers._read_passwordWrapper(json['passwordWrapper']),
  );
}

Map<String, dynamic> _$ProfileKeyWrappersToJson(ProfileKeyWrappers instance) =>
    <String, dynamic>{
      'unlockMode': ?instance.unlockMode,
      'unlockVerifier': ?instance.unlockVerifier?.toJson(),
      'masterKeyWrapper': ?instance.masterKeyWrapper?.toJson(),
      if (instance.passwordWrapper case final $value?)
        'passwordWrapper': ProfileKeyWrappers._write_passwordWrapper($value),
    };
