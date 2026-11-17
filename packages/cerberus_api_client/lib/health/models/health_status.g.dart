// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthStatus _$HealthStatusFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['status'],
    requiredKeys: const ['status'],
    disallowNullValues: const ['status'],
  );
  return HealthStatus(status: HealthStatus._read_status(json['status']));
}

Map<String, dynamic> _$HealthStatusToJson(HealthStatus instance) =>
    <String, dynamic>{'status': ?HealthStatus._write_status(instance.status)};
