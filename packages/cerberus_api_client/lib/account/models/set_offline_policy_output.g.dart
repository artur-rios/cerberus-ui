// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_offline_policy_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetOfflinePolicyOutput _$SetOfflinePolicyOutputFromJson(
  Map<String, dynamic> json,
) {
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
  return SetOfflinePolicyOutput(
    renewalEnabled: json['renewalEnabled'] as bool?,
    renewalInterval: json['renewalInterval'] as String?,
    policyRevision: SetOfflinePolicyOutput._read_policyRevision(
      json['policyRevision'],
    ),
    revocationGeneration: SetOfflinePolicyOutput._read_revocationGeneration(
      json['revocationGeneration'],
    ),
  );
}

Map<String, dynamic> _$SetOfflinePolicyOutputToJson(
  SetOfflinePolicyOutput instance,
) => <String, dynamic>{
  'renewalEnabled': ?instance.renewalEnabled,
  'renewalInterval': ?instance.renewalInterval,
  'policyRevision': ?SetOfflinePolicyOutput._write_policyRevision(
    instance.policyRevision,
  ),
  'revocationGeneration': ?SetOfflinePolicyOutput._write_revocationGeneration(
    instance.revocationGeneration,
  ),
};
