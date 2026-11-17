// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountOutput _$AccountOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['id', 'revision', 'state', 'details'],
    requiredKeys: const ['details'],
    disallowNullValues: const ['id', 'revision', 'details'],
  );
  return AccountOutput(
    id: json['id'] as String?,
    revision: AccountOutput._read_revision(json['revision']),
    state: json['state'] as String?,
    details: EncryptedEnvelope.fromJson(
      json['details'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$AccountOutputToJson(AccountOutput instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'revision': ?AccountOutput._write_revision(instance.revision),
      'state': ?instance.state,
      'details': instance.details.toJson(),
    };
