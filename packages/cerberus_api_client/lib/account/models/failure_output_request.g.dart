// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FailureOutput$Request _$FailureOutput$RequestFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp'],
  );
  return FailureOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: FailureOutput$Request._read_timestamp(json['timestamp']),
    data: FailureOutput$Request._read_data(json['data']),
  );
}

Map<String, dynamic> _$FailureOutput$RequestToJson(
  FailureOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?FailureOutput$Request._write_timestamp(instance.timestamp),
  'data': ?FailureOutput$Request._write_data(instance.data),
};
