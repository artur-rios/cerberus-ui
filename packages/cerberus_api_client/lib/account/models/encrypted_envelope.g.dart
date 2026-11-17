// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'encrypted_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EncryptedEnvelope _$EncryptedEnvelopeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'format',
      'keyEpoch',
      'keySalt',
      'nonce',
      'ciphertext',
      'tag',
    ],
    disallowNullValues: const ['keyEpoch'],
  );
  return EncryptedEnvelope(
    format: json['format'] as String?,
    keyEpoch: EncryptedEnvelope._read_keyEpoch(json['keyEpoch']),
    keySalt: json['keySalt'] as String?,
    nonce: json['nonce'] as String?,
    ciphertext: json['ciphertext'] as String?,
    tag: json['tag'] as String?,
  );
}

Map<String, dynamic> _$EncryptedEnvelopeToJson(EncryptedEnvelope instance) =>
    <String, dynamic>{
      'format': ?instance.format,
      'keyEpoch': ?EncryptedEnvelope._write_keyEpoch(instance.keyEpoch),
      'keySalt': ?instance.keySalt,
      'nonce': ?instance.nonce,
      'ciphertext': ?instance.ciphertext,
      'tag': ?instance.tag,
    };
