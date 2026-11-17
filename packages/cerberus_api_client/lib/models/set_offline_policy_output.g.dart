// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_offline_policy_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetOfflinePolicyOutput _$SetOfflinePolicyOutputFromJson(
  Map<String, dynamic> json,
) => SetOfflinePolicyOutput(
  renewalEnabled: json['renewalEnabled'] as bool?,
  renewalInterval: json['renewalInterval'] as String?,
  policyRevision: (json['policyRevision'] as num?)?.toInt(),
  revocationGeneration: (json['revocationGeneration'] as num?)?.toInt(),
);

Map<String, dynamic> _$SetOfflinePolicyOutputToJson(
  SetOfflinePolicyOutput instance,
) => <String, dynamic>{
  'renewalEnabled': instance.renewalEnabled,
  'renewalInterval': instance.renewalInterval,
  'policyRevision': instance.policyRevision,
  'revocationGeneration': instance.revocationGeneration,
};
