// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HealthComponent _$HealthComponentFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['name', 'status', 'elapsedMilliseconds'],
    requiredKeys: const ['name', 'status', 'elapsedMilliseconds'],
    disallowNullValues: const ['name', 'status', 'elapsedMilliseconds'],
  );
  return HealthComponent(
    name: HealthComponent._read_name(json['name']),
    status: HealthComponent._read_status(json['status']),
    elapsedMilliseconds: HealthComponent._read_elapsedMilliseconds(
      json['elapsedMilliseconds'],
    ),
  );
}

Map<String, dynamic> _$HealthComponentToJson(HealthComponent instance) =>
    <String, dynamic>{
      'name': ?HealthComponent._write_name(instance.name),
      'status': ?HealthComponent._write_status(instance.status),
      'elapsedMilliseconds': ?HealthComponent._write_elapsedMilliseconds(
        instance.elapsedMilliseconds,
      ),
    };
