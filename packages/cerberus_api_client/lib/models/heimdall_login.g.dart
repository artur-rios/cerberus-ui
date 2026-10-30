// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heimdall_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeimdallLogin _$HeimdallLoginFromJson(Map<String, dynamic> json) =>
    HeimdallLogin(
      token: json['token'] as String?,
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      emailVerified: json['emailVerified'] as bool?,
      requiresTwoFactor: json['requiresTwoFactor'] as bool?,
      challengeToken: json['challengeToken'] as String?,
      availableMethods: (json['availableMethods'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HeimdallLoginToJson(HeimdallLogin instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'emailVerified': instance.emailVerified,
      'requiresTwoFactor': instance.requiresTwoFactor,
      'challengeToken': instance.challengeToken,
      'availableMethods': instance.availableMethods,
    };
