// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'recover_vault_output.dart';

part 'recover_vault_output_data_output.g.dart';

@JsonSerializable()
class RecoverVaultOutputDataOutput {
  const RecoverVaultOutputDataOutput({
    this.messages,
    this.errors,
    this.timestamp,
    this.success,
    this.data,
  });

  factory RecoverVaultOutputDataOutput.fromJson(Map<String, Object?> json) =>
      _$RecoverVaultOutputDataOutputFromJson(json);

  final List<String>? messages;
  final List<String>? errors;
  final DateTime? timestamp;
  final bool? success;
  final RecoverVaultOutput? data;

  Map<String, Object?> toJson() => _$RecoverVaultOutputDataOutputToJson(this);
}
