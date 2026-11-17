// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAccountCommand _$UpdateAccountCommandFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['expectedRevision', 'details'],
    disallowNullValues: const ['expectedRevision', 'details'],
  );
  return UpdateAccountCommand(
    expectedRevision: UpdateAccountCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    details: json['details'] == null
        ? null
        : EncryptedEnvelope.fromJson(json['details'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateAccountCommandToJson(
  UpdateAccountCommand instance,
) => <String, dynamic>{
  'expectedRevision': ?UpdateAccountCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'details': ?instance.details?.toJson(),
};
