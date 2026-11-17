// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'health_component_name.dart';
import 'health_component_status.dart';

part 'health_component.g.dart';

@JsonSerializable()
class HealthComponent {
  const HealthComponent({
    required this.name,
    required this.status,
    required this.elapsedMilliseconds,
  });

  factory HealthComponent.fromJson(Map<String, Object?> json) =>
      _$HealthComponentFromJson(json);

  final HealthComponentName name;
  final HealthComponentStatus status;
  final int elapsedMilliseconds;

  Map<String, Object?> toJson() => _$HealthComponentToJson(this);
}
