// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationAccount _$AuthenticationAccountFromJson(
  Map<String, dynamic> json,
) => AuthenticationAccount(
  id: json['id'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$AuthenticationAccountToJson(
  AuthenticationAccount instance,
) => <String, dynamic>{'id': instance.id, 'revision': instance.revision};
