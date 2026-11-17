// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportHeader _$AccountExportHeaderFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'identityId',
      'revision',
      'policyRevision',
      'revocationGeneration',
      'renewalEnabled',
      'renewalIntervalSeconds',
      'serverTime',
    ],
    requiredKeys: const [
      'accountId',
      'identityId',
      'revision',
      'policyRevision',
      'revocationGeneration',
      'renewalEnabled',
      'renewalIntervalSeconds',
      'serverTime',
    ],
    disallowNullValues: const [
      'accountId',
      'identityId',
      'revision',
      'policyRevision',
      'revocationGeneration',
      'renewalEnabled',
      'serverTime',
    ],
  );
  return AccountExportHeader(
    accountId: json['accountId'] as String,
    identityId: json['identityId'] as String,
    revision: AccountExportHeader._read_revision(json['revision']),
    policyRevision: AccountExportHeader._read_policyRevision(
      json['policyRevision'],
    ),
    revocationGeneration: AccountExportHeader._read_revocationGeneration(
      json['revocationGeneration'],
    ),
    renewalEnabled: json['renewalEnabled'] as bool,
    renewalIntervalSeconds: AccountExportHeader._read_renewalIntervalSeconds(
      json['renewalIntervalSeconds'],
    ),
    serverTime: AccountExportHeader._read_serverTime(json['serverTime']),
  );
}

Map<String, dynamic> _$AccountExportHeaderToJson(
  AccountExportHeader instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'identityId': instance.identityId,
  'revision': ?AccountExportHeader._write_revision(instance.revision),
  'policyRevision': ?AccountExportHeader._write_policyRevision(
    instance.policyRevision,
  ),
  'revocationGeneration': ?AccountExportHeader._write_revocationGeneration(
    instance.revocationGeneration,
  ),
  'renewalEnabled': instance.renewalEnabled,
  'renewalIntervalSeconds': AccountExportHeader._write_renewalIntervalSeconds(
    instance.renewalIntervalSeconds,
  ),
  'serverTime': ?AccountExportHeader._write_serverTime(instance.serverTime),
};
