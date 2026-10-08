// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_kdf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordKdf _$PasswordKdfFromJson(Map<String, dynamic> json) => PasswordKdf(
  algorithm: json['algorithm'] as String?,
  memoryKiB: (json['memoryKiB'] as num?)?.toInt(),
  iterations: (json['iterations'] as num?)?.toInt(),
  parallelism: (json['parallelism'] as num?)?.toInt(),
  salt: json['salt'] as String?,
);

Map<String, dynamic> _$PasswordKdfToJson(PasswordKdf instance) =>
    <String, dynamic>{
      'algorithm': instance.algorithm,
      'memoryKiB': instance.memoryKiB,
      'iterations': instance.iterations,
      'parallelism': instance.parallelism,
      'salt': instance.salt,
    };
