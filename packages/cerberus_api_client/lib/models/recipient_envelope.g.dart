// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipientEnvelope _$RecipientEnvelopeFromJson(Map<String, dynamic> json) =>
    RecipientEnvelope(
      format: json['format'] as String?,
      keyEpoch: (json['keyEpoch'] as num?)?.toInt(),
      grantId: json['grantId'] as String?,
      grantRevision: (json['grantRevision'] as num?)?.toInt(),
      recipientIdentityId: json['recipientIdentityId'] as String?,
      recipientKeyFingerprint: json['recipientKeyFingerprint'] as String?,
      authorKeyFingerprint: json['authorKeyFingerprint'] as String?,
      enc: json['enc'] as String?,
      ciphertext: json['ciphertext'] as String?,
      signature: json['signature'] as String?,
    );

Map<String, dynamic> _$RecipientEnvelopeToJson(RecipientEnvelope instance) =>
    <String, dynamic>{
      'format': instance.format,
      'keyEpoch': instance.keyEpoch,
      'grantId': instance.grantId,
      'grantRevision': instance.grantRevision,
      'recipientIdentityId': instance.recipientIdentityId,
      'recipientKeyFingerprint': instance.recipientKeyFingerprint,
      'authorKeyFingerprint': instance.authorKeyFingerprint,
      'enc': instance.enc,
      'ciphertext': instance.ciphertext,
      'signature': instance.signature,
    };
