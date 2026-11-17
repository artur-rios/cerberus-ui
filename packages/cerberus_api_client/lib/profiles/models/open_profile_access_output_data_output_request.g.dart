// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_profile_access_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenProfileAccessOutputDataOutput$Request
_$OpenProfileAccessOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return OpenProfileAccessOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: OpenProfileAccessOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : OpenProfileAccessOutput.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$OpenProfileAccessOutputDataOutput$RequestToJson(
  OpenProfileAccessOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?OpenProfileAccessOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
