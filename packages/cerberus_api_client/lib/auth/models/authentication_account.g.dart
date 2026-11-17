// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationAccount _$AuthenticationAccountFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'revision'],
    disallowNullValues: const ['id', 'revision'],
  );
  return AuthenticationAccount(
    id: json['id'] as String?,
    revision: AuthenticationAccount._read_revision(json['revision']),
  );
}

Map<String, dynamic> _$AuthenticationAccountToJson(
  AuthenticationAccount instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'revision': ?AuthenticationAccount._write_revision(instance.revision),
};
