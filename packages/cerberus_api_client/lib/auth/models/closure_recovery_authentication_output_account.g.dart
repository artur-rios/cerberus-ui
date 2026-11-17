// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closure_recovery_authentication_output_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureRecoveryDetails _$AccountClosureRecoveryDetailsFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'revision',
      'closureDeadline',
      'serverTime',
    ],
    requiredKeys: const [
      'accountId',
      'revision',
      'closureDeadline',
      'serverTime',
    ],
    disallowNullValues: const [
      'accountId',
      'revision',
      'closureDeadline',
      'serverTime',
    ],
  );
  return AccountClosureRecoveryDetails(
    accountId: json['accountId'] as String,
    revision: AccountClosureRecoveryDetails._read_revision(json['revision']),
    closureDeadline: AccountClosureRecoveryDetails._read_closureDeadline(
      json['closureDeadline'],
    ),
    serverTime: AccountClosureRecoveryDetails._read_serverTime(
      json['serverTime'],
    ),
  );
}

Map<String, dynamic> _$AccountClosureRecoveryDetailsToJson(
  AccountClosureRecoveryDetails instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'revision': ?AccountClosureRecoveryDetails._write_revision(instance.revision),
  'closureDeadline': ?AccountClosureRecoveryDetails._write_closureDeadline(
    instance.closureDeadline,
  ),
  'serverTime': ?AccountClosureRecoveryDetails._write_serverTime(
    instance.serverTime,
  ),
};
