// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'vault_unlock_output.dart';

part 'vault_unlock_output_data_output.g.dart';

@JsonSerializable()
class VaultUnlockOutputDataOutput {
  const VaultUnlockOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory VaultUnlockOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$VaultUnlockOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final VaultUnlockOutput? data;

  Map<String, Object?> toJson() => _$VaultUnlockOutputDataOutputToJson(this);
}
