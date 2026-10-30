// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'password_kdf.g.dart';

@JsonSerializable()
class PasswordKdf {
  const PasswordKdf({
    this.algorithm,
    this.memoryKiB,
    this.iterations,
    this.parallelism,
    this.salt,
  });

  factory PasswordKdf.fromJson(Map<String, Object?> json) =>
      _$PasswordKdfFromJson(json);

  final String? algorithm;
  final int? memoryKiB;
  final int? iterations;
  final int? parallelism;
  final String? salt;

  Map<String, Object?> toJson() => _$PasswordKdfToJson(this);
}
