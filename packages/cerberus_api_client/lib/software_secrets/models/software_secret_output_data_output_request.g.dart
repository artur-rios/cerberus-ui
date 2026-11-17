// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'software_secret_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoftwareSecretOutputDataOutput$Request
_$SoftwareSecretOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return SoftwareSecretOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: SoftwareSecretOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : SoftwareSecretOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SoftwareSecretOutputDataOutput$RequestToJson(
  SoftwareSecretOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?SoftwareSecretOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
