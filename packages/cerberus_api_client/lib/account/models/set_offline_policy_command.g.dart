// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_offline_policy_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetOfflinePolicyCommand _$SetOfflinePolicyCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'expectedPolicyRevision',
      'renewalEnabled',
      'renewalInterval',
    ],
    requiredKeys: const [
      'expectedPolicyRevision',
      'renewalEnabled',
      'renewalInterval',
    ],
    disallowNullValues: const ['expectedPolicyRevision', 'renewalEnabled'],
  );
  return SetOfflinePolicyCommand(
    expectedPolicyRevision:
        SetOfflinePolicyCommand._read_expectedPolicyRevision(
          json['expectedPolicyRevision'],
        ),
    renewalEnabled: json['renewalEnabled'] as bool,
    renewalInterval: json['renewalInterval'] as String?,
  );
}

Map<String, dynamic> _$SetOfflinePolicyCommandToJson(
  SetOfflinePolicyCommand instance,
) => <String, dynamic>{
  'expectedPolicyRevision':
      ?SetOfflinePolicyCommand._write_expectedPolicyRevision(
        instance.expectedPolicyRevision,
      ),
  'renewalEnabled': instance.renewalEnabled,
  'renewalInterval': instance.renewalInterval,
};
