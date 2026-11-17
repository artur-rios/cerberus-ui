// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_closure_cancellation_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureCancellationOutput _$AccountClosureCancellationOutputFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'revision',
      'revocationGeneration',
      'cancelledAt',
      'serverTime',
    ],
    requiredKeys: const [
      'accountId',
      'revision',
      'revocationGeneration',
      'cancelledAt',
      'serverTime',
    ],
    disallowNullValues: const [
      'accountId',
      'revision',
      'revocationGeneration',
      'cancelledAt',
      'serverTime',
    ],
  );
  return AccountClosureCancellationOutput(
    accountId: json['accountId'] as String,
    revision: AccountClosureCancellationOutput._read_revision(json['revision']),
    revocationGeneration:
        AccountClosureCancellationOutput._read_revocationGeneration(
          json['revocationGeneration'],
        ),
    cancelledAt: AccountClosureCancellationOutput._read_cancelledAt(
      json['cancelledAt'],
    ),
    serverTime: AccountClosureCancellationOutput._read_serverTime(
      json['serverTime'],
    ),
  );
}

Map<String, dynamic> _$AccountClosureCancellationOutputToJson(
  AccountClosureCancellationOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'revision': ?AccountClosureCancellationOutput._write_revision(
    instance.revision,
  ),
  'revocationGeneration':
      ?AccountClosureCancellationOutput._write_revocationGeneration(
        instance.revocationGeneration,
      ),
  'cancelledAt': ?AccountClosureCancellationOutput._write_cancelledAt(
    instance.cancelledAt,
  ),
  'serverTime': ?AccountClosureCancellationOutput._write_serverTime(
    instance.serverTime,
  ),
};
