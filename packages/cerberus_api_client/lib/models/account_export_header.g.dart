// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportHeader _$AccountExportHeaderFromJson(Map<String, dynamic> json) =>
    AccountExportHeader(
      accountId: json['accountId'] as String,
      identityId: json['identityId'] as String,
      revision: (json['revision'] as num).toInt(),
      policyRevision: (json['policyRevision'] as num).toInt(),
      revocationGeneration: (json['revocationGeneration'] as num).toInt(),
      renewalEnabled: json['renewalEnabled'] as bool,
      renewalIntervalSeconds: (json['renewalIntervalSeconds'] as num?)?.toInt(),
      serverTime: DateTime.parse(json['serverTime'] as String),
    );

Map<String, dynamic> _$AccountExportHeaderToJson(
  AccountExportHeader instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'identityId': instance.identityId,
  'revision': instance.revision,
  'policyRevision': instance.policyRevision,
  'revocationGeneration': instance.revocationGeneration,
  'renewalEnabled': instance.renewalEnabled,
  'renewalIntervalSeconds': instance.renewalIntervalSeconds,
  'serverTime': instance.serverTime.toIso8601String(),
};
