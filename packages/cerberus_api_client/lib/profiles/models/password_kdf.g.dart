// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_kdf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordKdf _$PasswordKdfFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'algorithm',
      'memoryKiB',
      'iterations',
      'parallelism',
      'salt',
    ],
    disallowNullValues: const ['memoryKiB', 'iterations', 'parallelism'],
  );
  return PasswordKdf(
    algorithm: json['algorithm'] as String?,
    memoryKiB: PasswordKdf._read_memoryKiB(json['memoryKiB']),
    iterations: PasswordKdf._read_iterations(json['iterations']),
    parallelism: PasswordKdf._read_parallelism(json['parallelism']),
    salt: json['salt'] as String?,
  );
}

Map<String, dynamic> _$PasswordKdfToJson(PasswordKdf instance) =>
    <String, dynamic>{
      'algorithm': ?instance.algorithm,
      'memoryKiB': ?PasswordKdf._write_memoryKiB(instance.memoryKiB),
      'iterations': ?PasswordKdf._write_iterations(instance.iterations),
      'parallelism': ?PasswordKdf._write_parallelism(instance.parallelism),
      'salt': ?instance.salt,
    };
