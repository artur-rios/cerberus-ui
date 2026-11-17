// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_collection_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrantCollectionAccessCommand _$GrantCollectionAccessCommandFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const [
      'grantId',
      'recipientAccountId',
      'expectedRevision',
      'access',
      'keyEnvelope',
    ],
    requiredKeys: const [
      'grantId',
      'recipientAccountId',
      'expectedRevision',
      'access',
      'keyEnvelope',
    ],
    disallowNullValues: const ['grantId', 'recipientAccountId', 'keyEnvelope'],
  );
  return GrantCollectionAccessCommand(
    grantId: json['grantId'] as String,
    recipientAccountId: json['recipientAccountId'] as String,
    expectedRevision: GrantCollectionAccessCommand._read_expectedRevision(
      json['expectedRevision'],
    ),
    access: json['access'] as String?,
    keyEnvelope: RecipientEnvelope.fromJson(
      json['keyEnvelope'] as Map<String, dynamic>,
    ),
  );
}

Map<String, dynamic> _$GrantCollectionAccessCommandToJson(
  GrantCollectionAccessCommand instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'recipientAccountId': instance.recipientAccountId,
  'expectedRevision': GrantCollectionAccessCommand._write_expectedRevision(
    instance.expectedRevision,
  ),
  'access': instance.access,
  'keyEnvelope': instance.keyEnvelope.toJson(),
};
