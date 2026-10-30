// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'vault_initialization_output.dart';

part 'vault_initialization_output_data_output.g.dart';

@JsonSerializable()
class VaultInitializationOutputDataOutput {
  const VaultInitializationOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory VaultInitializationOutputDataOutput.fromJson(
    Map<String, Object?> json,
  ) => _$VaultInitializationOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final VaultInitializationOutput? data;

  Map<String, Object?> toJson() =>
      _$VaultInitializationOutputDataOutputToJson(this);
}
