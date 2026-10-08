// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_wrapper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecoveryWrapper _$RecoveryWrapperFromJson(Map<String, dynamic> json) =>
    RecoveryWrapper(
      format: json['format'] as String?,
      keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
      keySalt: json['keySalt'] as String?,
      nonce: json['nonce'] as String?,
      ciphertext: json['ciphertext'] as String?,
      tag: json['tag'] as String?,
      generation: (json['generation'] as num?)?.toInt(),
      proofKeyFingerprint: json['proofKeyFingerprint'] as String?,
    );

Map<String, dynamic> _$RecoveryWrapperToJson(RecoveryWrapper instance) =>
    <String, dynamic>{
      'format': instance.format,
      'keyEpoch': instance.keyEpoch,
      'keySalt': instance.keySalt,
      'nonce': instance.nonce,
      'ciphertext': instance.ciphertext,
      'tag': instance.tag,
      'generation': instance.generation,
      'proofKeyFingerprint': instance.proofKeyFingerprint,
    };
