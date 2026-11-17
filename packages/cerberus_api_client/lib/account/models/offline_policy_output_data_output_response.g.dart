// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_policy_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflinePolicyOutputDataOutput$Response
_$OfflinePolicyOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return OfflinePolicyOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: OfflinePolicyOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : OfflinePolicyOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OfflinePolicyOutputDataOutput$ResponseToJson(
  OfflinePolicyOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?OfflinePolicyOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
