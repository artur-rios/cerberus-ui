// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordWrapper _$PasswordWrapperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'format',
      'keyEpoch',
      'keySalt',
      'nonce',
      'ciphertext',
      'tag',
      'kdf',
    ],
    disallowNullValues: const ['keyEpoch', 'kdf'],
  );
  return PasswordWrapper(
    format: json['format'] as String?,
    keyEpoch: PasswordWrapper._read_keyEpoch(json['keyEpoch']),
    keySalt: json['keySalt'] as String?,
    nonce: json['nonce'] as String?,
    ciphertext: json['ciphertext'] as String?,
    tag: json['tag'] as String?,
    kdf: json['kdf'] == null
        ? null
        : PasswordKdf.fromJson(json['kdf'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PasswordWrapperToJson(PasswordWrapper instance) =>
    <String, dynamic>{
      'format': ?instance.format,
      'keyEpoch': ?PasswordWrapper._write_keyEpoch(instance.keyEpoch),
      'keySalt': ?instance.keySalt,
      'nonce': ?instance.nonce,
      'ciphertext': ?instance.ciphertext,
      'tag': ?instance.tag,
      'kdf': ?instance.kdf?.toJson(),
    };
