// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_policy_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflinePolicyOutputDataOutput$Request
_$OfflinePolicyOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return OfflinePolicyOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: OfflinePolicyOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : OfflinePolicyOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OfflinePolicyOutputDataOutput$RequestToJson(
  OfflinePolicyOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?OfflinePolicyOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
