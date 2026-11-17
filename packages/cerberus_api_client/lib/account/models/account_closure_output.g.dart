// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_closure_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureOutput _$AccountClosureOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'revision',
      'revocationGeneration',
      'closureRequestedAt',
      'closureDeadline',
      'serverTime',
      'alreadyPending',
    ],
    requiredKeys: const [
      'accountId',
      'revision',
      'revocationGeneration',
      'closureRequestedAt',
      'closureDeadline',
      'serverTime',
      'alreadyPending',
    ],
    disallowNullValues: const [
      'accountId',
      'revision',
      'revocationGeneration',
      'closureRequestedAt',
      'closureDeadline',
      'serverTime',
      'alreadyPending',
    ],
  );
  return AccountClosureOutput(
    accountId: json['accountId'] as String,
    revision: AccountClosureOutput._read_revision(json['revision']),
    revocationGeneration: AccountClosureOutput._read_revocationGeneration(
      json['revocationGeneration'],
    ),
    closureRequestedAt: AccountClosureOutput._read_closureRequestedAt(
      json['closureRequestedAt'],
    ),
    closureDeadline: AccountClosureOutput._read_closureDeadline(
      json['closureDeadline'],
    ),
    serverTime: AccountClosureOutput._read_serverTime(json['serverTime']),
    alreadyPending: json['alreadyPending'] as bool,
  );
}

Map<String, dynamic> _$AccountClosureOutputToJson(
  AccountClosureOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'revision': ?AccountClosureOutput._write_revision(instance.revision),
  'revocationGeneration': ?AccountClosureOutput._write_revocationGeneration(
    instance.revocationGeneration,
  ),
  'closureRequestedAt': ?AccountClosureOutput._write_closureRequestedAt(
    instance.closureRequestedAt,
  ),
  'closureDeadline': ?AccountClosureOutput._write_closureDeadline(
    instance.closureDeadline,
  ),
  'serverTime': ?AccountClosureOutput._write_serverTime(instance.serverTime),
  'alreadyPending': instance.alreadyPending,
};
