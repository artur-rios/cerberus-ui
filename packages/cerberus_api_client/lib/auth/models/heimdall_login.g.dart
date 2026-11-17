// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heimdall_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeimdallLogin _$HeimdallLoginFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'token',
      'expiresAt',
      'emailVerified',
      'requiresTwoFactor',
      'challengeToken',
      'availableMethods',
    ],
    disallowNullValues: const ['requiresTwoFactor'],
  );
  return HeimdallLogin(
    token: json['token'] as String?,
    expiresAt: HeimdallLogin._read_expiresAt(json['expiresAt']),
    emailVerified: json['emailVerified'] as bool?,
    requiresTwoFactor: json['requiresTwoFactor'] as bool?,
    challengeToken: json['challengeToken'] as String?,
    availableMethods: (json['availableMethods'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

Map<String, dynamic> _$HeimdallLoginToJson(HeimdallLogin instance) =>
    <String, dynamic>{
      'token': ?instance.token,
      'expiresAt': ?HeimdallLogin._write_expiresAt(instance.expiresAt),
      'emailVerified': ?instance.emailVerified,
      'requiresTwoFactor': ?instance.requiresTwoFactor,
      'challengeToken': ?instance.challengeToken,
      'availableMethods': ?instance.availableMethods,
    };
