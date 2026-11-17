// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_deletion_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDeletionOutput _$AccountDeletionOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['accountId', 'deletedAt', 'state'],
    requiredKeys: const ['accountId', 'deletedAt', 'state'],
    disallowNullValues: const ['accountId', 'deletedAt', 'state'],
  );
  return AccountDeletionOutput(
    accountId: json['accountId'] as String,
    deletedAt: AccountDeletionOutput._read_deletedAt(json['deletedAt']),
    state: AccountDeletionOutput._read_state(json['state']),
  );
}

Map<String, dynamic> _$AccountDeletionOutputToJson(
  AccountDeletionOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'deletedAt': ?AccountDeletionOutput._write_deletedAt(instance.deletedAt),
  'state': ?AccountDeletionOutput._write_state(instance.state),
};
