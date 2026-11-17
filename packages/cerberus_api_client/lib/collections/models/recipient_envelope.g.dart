// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipient_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipientEnvelope _$RecipientEnvelopeFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'format',
      'keyEpoch',
      'grantId',
      'grantRevision',
      'recipientIdentityId',
      'recipientKeyFingerprint',
      'authorKeyFingerprint',
      'enc',
      'ciphertext',
      'signature',
    ],
    disallowNullValues: const [
      'keyEpoch',
      'grantId',
      'grantRevision',
      'recipientIdentityId',
    ],
  );
  return RecipientEnvelope(
    format: json['format'] as String?,
    keyEpoch: RecipientEnvelope._read_keyEpoch(json['keyEpoch']),
    grantId: json['grantId'] as String?,
    grantRevision: RecipientEnvelope._read_grantRevision(json['grantRevision']),
    recipientIdentityId: json['recipientIdentityId'] as String?,
    recipientKeyFingerprint: json['recipientKeyFingerprint'] as String?,
    authorKeyFingerprint: json['authorKeyFingerprint'] as String?,
    enc: json['enc'] as String?,
    ciphertext: json['ciphertext'] as String?,
    signature: json['signature'] as String?,
  );
}

Map<String, dynamic> _$RecipientEnvelopeToJson(RecipientEnvelope instance) =>
    <String, dynamic>{
      'format': ?instance.format,
      'keyEpoch': ?RecipientEnvelope._write_keyEpoch(instance.keyEpoch),
      'grantId': ?instance.grantId,
      'grantRevision': ?RecipientEnvelope._write_grantRevision(
        instance.grantRevision,
      ),
      'recipientIdentityId': ?instance.recipientIdentityId,
      'recipientKeyFingerprint': ?instance.recipientKeyFingerprint,
      'authorKeyFingerprint': ?instance.authorKeyFingerprint,
      'enc': ?instance.enc,
      'ciphertext': ?instance.ciphertext,
      'signature': ?instance.signature,
    };
