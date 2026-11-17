// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_output_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationOutputAccount _$AuthenticationOutputAccountFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'revision'],
    disallowNullValues: const ['id', 'revision'],
  );
  return AuthenticationOutputAccount(
    id: json['id'] as String?,
    revision: AuthenticationOutputAccount._read_revision(json['revision']),
  );
}

Map<String, dynamic> _$AuthenticationOutputAccountToJson(
  AuthenticationOutputAccount instance,
) => <String, dynamic>{
  'id': ?instance.id,
  'revision': ?AuthenticationOutputAccount._write_revision(instance.revision),
};
