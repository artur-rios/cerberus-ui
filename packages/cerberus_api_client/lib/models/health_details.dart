// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'health_component.dart';
import 'health_details_status.dart';

part 'health_details.g.dart';

@JsonSerializable()
class HealthDetails {
  const HealthDetails({required this.status, required this.components});

  factory HealthDetails.fromJson(Map<String, Object?> json) =>
      _$HealthDetailsFromJson(json);

  final HealthDetailsStatus status;
  final List<HealthComponent>? components;

  Map<String, Object?> toJson() => _$HealthDetailsToJson(this);
}
