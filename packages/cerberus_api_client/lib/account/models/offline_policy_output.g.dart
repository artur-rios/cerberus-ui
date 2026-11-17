// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_policy_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflinePolicyOutput _$OfflinePolicyOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'renewalEnabled',
      'renewalInterval',
      'policyRevision',
      'revocationGeneration',
    ],
    disallowNullValues: const [
      'renewalEnabled',
      'policyRevision',
      'revocationGeneration',
    ],
  );
  return OfflinePolicyOutput(
    renewalEnabled: json['renewalEnabled'] as bool?,
    renewalInterval: json['renewalInterval'] as String?,
    policyRevision: OfflinePolicyOutput._read_policyRevision(
      json['policyRevision'],
    ),
    revocationGeneration: OfflinePolicyOutput._read_revocationGeneration(
      json['revocationGeneration'],
    ),
  );
}

Map<String, dynamic> _$OfflinePolicyOutputToJson(
  OfflinePolicyOutput instance,
) => <String, dynamic>{
  'renewalEnabled': ?instance.renewalEnabled,
  'renewalInterval': ?instance.renewalInterval,
  'policyRevision': ?OfflinePolicyOutput._write_policyRevision(
    instance.policyRevision,
  ),
  'revocationGeneration': ?OfflinePolicyOutput._write_revocationGeneration(
    instance.revocationGeneration,
  ),
};
