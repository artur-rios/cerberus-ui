// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_replacement_key_wrappers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentReplacementKeyWrappers _$ContentReplacementKeyWrappersFromJson(
  Map<String, dynamic> json,
) {
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
  return ContentReplacementKeyWrappers(
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
        : ContentReplacementKeyWrappers._read_passwordWrapper(
            json['passwordWrapper'],
          ),
  );
}

Map<String, dynamic> _$ContentReplacementKeyWrappersToJson(
  ContentReplacementKeyWrappers instance,
) => <String, dynamic>{
  'unlockMode': ?instance.unlockMode,
  'unlockVerifier': ?instance.unlockVerifier?.toJson(),
  'masterKeyWrapper': ?instance.masterKeyWrapper?.toJson(),
  if (instance.passwordWrapper case final $value?)
    'passwordWrapper': ContentReplacementKeyWrappers._write_passwordWrapper(
      $value,
    ),
};
