// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthDetails _$HealthDetailsFromJson(Map<String, dynamic> json) =>
    HealthDetails(
      status: HealthDetailsStatus.fromJson(json['status'] as String),
      components: (json['components'] as List<dynamic>?)
          ?.map((e) => HealthComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HealthDetailsToJson(HealthDetails instance) =>
    <String, dynamic>{
      'status': _$HealthDetailsStatusEnumMap[instance.status]!,
      'components': instance.components,
    };

const _$HealthDetailsStatusEnumMap = {
  HealthDetailsStatus.healthy: 'healthy',
  HealthDetailsStatus.unhealthy: 'unhealthy',
  HealthDetailsStatus.$unknown: r'$unknown',
};
