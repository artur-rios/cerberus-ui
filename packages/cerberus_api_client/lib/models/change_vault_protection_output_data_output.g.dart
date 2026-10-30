// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_vault_protection_output_data_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangeVaultProtectionOutputDataOutput
_$ChangeVaultProtectionOutputDataOutputFromJson(Map<String, dynamic> json) =>
    ChangeVaultProtectionOutputDataOutput(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : ChangeVaultProtectionOutput.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ChangeVaultProtectionOutputDataOutputToJson(
  ChangeVaultProtectionOutputDataOutput instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'errors': instance.errors,
  'timestamp': instance.timestamp?.toIso8601String(),
  'success': instance.success,
  'data': instance.data,
};
