// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationOutput _$AuthenticationOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['identity', 'account'],
    requiredKeys: const ['identity'],
    disallowNullValues: const ['identity'],
  );
  return AuthenticationOutput(
    identity: HeimdallLogin.fromJson(json['identity'] as Map<String, dynamic>),
    account: json['account'] == null
        ? null
        : AuthenticationOutputAccount.fromJson(
            json['account'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$AuthenticationOutputToJson(
  AuthenticationOutput instance,
) => <String, dynamic>{
  'identity': instance.identity.toJson(),
  'account': ?instance.account?.toJson(),
};
