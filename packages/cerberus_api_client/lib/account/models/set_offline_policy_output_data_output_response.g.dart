// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_offline_policy_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetOfflinePolicyOutputDataOutput$Response
_$SetOfflinePolicyOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return SetOfflinePolicyOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: SetOfflinePolicyOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : SetOfflinePolicyOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SetOfflinePolicyOutputDataOutput$ResponseToJson(
  SetOfflinePolicyOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?SetOfflinePolicyOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
