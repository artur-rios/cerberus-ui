// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_profile_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProfileOutputDataOutput$Request
_$CreateProfileOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return CreateProfileOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: CreateProfileOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : CreateProfileOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateProfileOutputDataOutput$RequestToJson(
  CreateProfileOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?CreateProfileOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
