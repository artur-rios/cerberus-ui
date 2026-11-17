// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoveryWrapper _$RecoveryWrapperFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'format',
      'keyEpoch',
      'keySalt',
      'nonce',
      'ciphertext',
      'tag',
      'generation',
      'proofKeyFingerprint',
    ],
    disallowNullValues: const ['keyEpoch', 'generation'],
  );
  return RecoveryWrapper(
    format: json['format'] as String?,
    keyEpoch: RecoveryWrapper._read_keyEpoch(json['keyEpoch']),
    keySalt: json['keySalt'] as String?,
    nonce: json['nonce'] as String?,
    ciphertext: json['ciphertext'] as String?,
    tag: json['tag'] as String?,
    generation: RecoveryWrapper._read_generation(json['generation']),
    proofKeyFingerprint: json['proofKeyFingerprint'] as String?,
  );
}

Map<String, dynamic> _$RecoveryWrapperToJson(RecoveryWrapper instance) =>
    <String, dynamic>{
      'format': ?instance.format,
      'keyEpoch': ?RecoveryWrapper._write_keyEpoch(instance.keyEpoch),
      'keySalt': ?instance.keySalt,
      'nonce': ?instance.nonce,
      'ciphertext': ?instance.ciphertext,
      'tag': ?instance.tag,
      'generation': ?RecoveryWrapper._write_generation(instance.generation),
      'proofKeyFingerprint': ?instance.proofKeyFingerprint,
    };
