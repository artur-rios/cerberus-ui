// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_protection_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultProtectionOutputDataOutput$Response
_$VaultProtectionOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return VaultProtectionOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: VaultProtectionOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : VaultProtectionOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VaultProtectionOutputDataOutput$ResponseToJson(
  VaultProtectionOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?VaultProtectionOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
