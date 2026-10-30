// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordWrapper _$PasswordWrapperFromJson(Map<String, dynamic> json) =>
    PasswordWrapper(
      format: json['format'] as String?,
      keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
      keySalt: json['keySalt'] as String?,
      nonce: json['nonce'] as String?,
      ciphertext: json['ciphertext'] as String?,
      tag: json['tag'] as String?,
      kdf: json['kdf'] == null
          ? null
          : PasswordKdf.fromJson(json['kdf'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PasswordWrapperToJson(PasswordWrapper instance) =>
    <String, dynamic>{
      'format': instance.format,
      'keyEpoch': instance.keyEpoch,
      'keySalt': instance.keySalt,
      'nonce': instance.nonce,
      'ciphertext': instance.ciphertext,
      'tag': instance.tag,
      'kdf': instance.kdf,
    };
