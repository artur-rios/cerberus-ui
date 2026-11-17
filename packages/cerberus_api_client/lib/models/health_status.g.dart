// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthStatus _$HealthStatusFromJson(Map<String, dynamic> json) =>
    HealthStatus(status: HealthStatusStatus.fromJson(json['status'] as String));

Map<String, dynamic> _$HealthStatusToJson(HealthStatus instance) =>
    <String, dynamic>{'status': _$HealthStatusStatusEnumMap[instance.status]!};

const _$HealthStatusStatusEnumMap = {
  HealthStatusStatus.healthy: 'healthy',
  HealthStatusStatus.unhealthy: 'unhealthy',
  HealthStatusStatus.$unknown: r'$unknown',
};
