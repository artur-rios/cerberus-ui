// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthComponent _$HealthComponentFromJson(Map<String, dynamic> json) =>
    HealthComponent(
      name: HealthComponentName.fromJson(json['name'] as String),
      status: HealthComponentStatus.fromJson(json['status'] as String),
      elapsedMilliseconds: (json['elapsedMilliseconds'] as num).toInt(),
    );

Map<String, dynamic> _$HealthComponentToJson(HealthComponent instance) =>
    <String, dynamic>{
      'name': _$HealthComponentNameEnumMap[instance.name]!,
      'status': _$HealthComponentStatusEnumMap[instance.status]!,
      'elapsedMilliseconds': instance.elapsedMilliseconds,
    };

const _$HealthComponentNameEnumMap = {
  HealthComponentName.database: 'database',
  HealthComponentName.identity: 'identity',
  HealthComponentName.restore: 'restore',
  HealthComponentName.$unknown: r'$unknown',
};

const _$HealthComponentStatusEnumMap = {
  HealthComponentStatus.healthy: 'healthy',
  HealthComponentStatus.unhealthy: 'unhealthy',
  HealthComponentStatus.$unknown: r'$unknown',
};
