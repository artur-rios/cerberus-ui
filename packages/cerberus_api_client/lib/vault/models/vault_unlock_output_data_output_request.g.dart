// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_unlock_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultUnlockOutputDataOutput$Request
_$VaultUnlockOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return VaultUnlockOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: VaultUnlockOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : VaultUnlockOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VaultUnlockOutputDataOutput$RequestToJson(
  VaultUnlockOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?VaultUnlockOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
