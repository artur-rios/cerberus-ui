// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'failure_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FailureOutput$Response _$FailureOutput$ResponseFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success'],
  );
  return FailureOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: FailureOutput$Response._read_timestamp(json['timestamp']),
    success: json['success'] as bool?,
    data: FailureOutput$Response._read_data(json['data']),
  );
}

Map<String, dynamic> _$FailureOutput$ResponseToJson(
  FailureOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?FailureOutput$Response._write_timestamp(instance.timestamp),
  'success': ?instance.success,
  'data': ?FailureOutput$Response._write_data(instance.data),
};
