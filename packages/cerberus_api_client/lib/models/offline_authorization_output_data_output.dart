// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'offline_authorization_output.dart';

part 'offline_authorization_output_data_output.g.dart';

@JsonSerializable()
class OfflineAuthorizationOutputDataOutput {
  const OfflineAuthorizationOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory OfflineAuthorizationOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$OfflineAuthorizationOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final OfflineAuthorizationOutput? data;

  Map<String, Object?> toJson() =>
      _$OfflineAuthorizationOutputDataOutputToJson(this);
}
