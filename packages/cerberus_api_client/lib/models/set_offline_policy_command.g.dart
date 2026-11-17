// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_offline_policy_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetOfflinePolicyCommand _$SetOfflinePolicyCommandFromJson(
  Map<String, dynamic> json,
) => SetOfflinePolicyCommand(
  expectedPolicyRevision: (json['expectedPolicyRevision'] as num).toInt(),
  renewalEnabled: json['renewalEnabled'] as bool,
  renewalInterval: json['renewalInterval'] as String?,
);

Map<String, dynamic> _$SetOfflinePolicyCommandToJson(
  SetOfflinePolicyCommand instance,
) => <String, dynamic>{
  'expectedPolicyRevision': instance.expectedPolicyRevision,
  'renewalEnabled': instance.renewalEnabled,
  'renewalInterval': instance.renewalInterval,
};
