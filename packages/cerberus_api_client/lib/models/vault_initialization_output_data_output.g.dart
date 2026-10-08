// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_initialization_output_data_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultInitializationOutputDataOutput
_$VaultInitializationOutputDataOutputFromJson(Map<String, dynamic> json) =>
    VaultInitializationOutputDataOutput(
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
          : VaultInitializationOutput.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VaultInitializationOutputDataOutputToJson(
  VaultInitializationOutputDataOutput instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'errors': instance.errors,
  'timestamp': instance.timestamp?.toIso8601String(),
  'success': instance.success,
  'data': instance.data,
};
