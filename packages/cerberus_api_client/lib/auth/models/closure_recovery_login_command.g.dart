// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closure_recovery_login_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClosureRecoveryLoginCommand _$ClosureRecoveryLoginCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['email', 'password'],
    requiredKeys: const ['email', 'password'],
  );
  return ClosureRecoveryLoginCommand(
    email: json['email'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$ClosureRecoveryLoginCommandToJson(
  ClosureRecoveryLoginCommand instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};
