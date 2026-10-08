// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'vault_protection_output.dart';

part 'vault_protection_output_data_output.g.dart';

@JsonSerializable()
class VaultProtectionOutputDataOutput {
  const VaultProtectionOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory VaultProtectionOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$VaultProtectionOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final VaultProtectionOutput? data;

  Map<String, Object?> toJson() =>
      _$VaultProtectionOutputDataOutputToJson(this);
}
