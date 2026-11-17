// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_unlock_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultUnlockOutputDataOutput$Response
_$VaultUnlockOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return VaultUnlockOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: VaultUnlockOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : VaultUnlockOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VaultUnlockOutputDataOutput$ResponseToJson(
  VaultUnlockOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?VaultUnlockOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
