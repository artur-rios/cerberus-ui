// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_health_details_response503_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthDetails _$HealthDetailsFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['status', 'components'],
    requiredKeys: const ['status', 'components'],
    disallowNullValues: const ['status'],
  );
  return HealthDetails(
    status: HealthDetails._read_status(json['status']),
    components: (json['components'] as List<dynamic>?)
        ?.map((e) => HealthComponent.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HealthDetailsToJson(HealthDetails instance) =>
    <String, dynamic>{
      'status': ?HealthDetails._write_status(instance.status),
      'components': instance.components?.map((e) => e.toJson()).toList(),
    };

ProcessOutput$Response _$ProcessOutput$ResponseFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success'],
    disallowNullValues: const ['timestamp', 'success'],
  );
  return ProcessOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: ProcessOutput$Response._read_timestamp(json['timestamp']),
    success: json['success'] as bool?,
  );
}

Map<String, dynamic> _$ProcessOutput$ResponseToJson(
  ProcessOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?ProcessOutput$Response._write_timestamp(instance.timestamp),
  'success': ?instance.success,
};
