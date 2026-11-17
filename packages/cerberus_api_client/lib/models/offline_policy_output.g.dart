// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_policy_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflinePolicyOutput _$OfflinePolicyOutputFromJson(Map<String, dynamic> json) =>
    OfflinePolicyOutput(
      renewalEnabled: json['renewalEnabled'] as bool?,
      renewalInterval: json['renewalInterval'] as String?,
      policyRevision: (json['policyRevision'] as num?)?.toInt(),
      revocationGeneration: (json['revocationGeneration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OfflinePolicyOutputToJson(
  OfflinePolicyOutput instance,
) => <String, dynamic>{
  'renewalEnabled': instance.renewalEnabled,
  'renewalInterval': instance.renewalInterval,
  'policyRevision': instance.policyRevision,
  'revocationGeneration': instance.revocationGeneration,
};
