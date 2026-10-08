// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypted_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncryptedEnvelope _$EncryptedEnvelopeFromJson(Map<String, dynamic> json) =>
    EncryptedEnvelope(
      format: json['format'] as String?,
      keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
      keySalt: json['keySalt'] as String?,
      nonce: json['nonce'] as String?,
      ciphertext: json['ciphertext'] as String?,
      tag: json['tag'] as String?,
    );

Map<String, dynamic> _$EncryptedEnvelopeToJson(EncryptedEnvelope instance) =>
    <String, dynamic>{
      'format': instance.format,
      'keyEpoch': instance.keyEpoch,
      'keySalt': instance.keySalt,
      'nonce': instance.nonce,
      'ciphertext': instance.ciphertext,
      'tag': instance.tag,
    };
