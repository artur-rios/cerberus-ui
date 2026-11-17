// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_account_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAccountCommand _$RegisterAccountCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['accountId', 'idempotencyKey', 'identity', 'details'],
    disallowNullValues: const [
      'accountId',
      'idempotencyKey',
      'identity',
      'details',
    ],
  );
  return RegisterAccountCommand(
    accountId: json['accountId'] as String?,
    idempotencyKey: json['idempotencyKey'] as String?,
    identity: json['identity'] == null
        ? null
        : HeimdallRegistration.fromJson(
            json['identity'] as Map<String, dynamic>,
          ),
    details: json['details'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['details'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegisterAccountCommandToJson(
  RegisterAccountCommand instance,
) => <String, dynamic>{
  'accountId': ?instance.accountId,
  'idempotencyKey': ?instance.idempotencyKey,
  'identity': ?instance.identity?.toJson(),
  'details': ?instance.details?.toJson(),
};
