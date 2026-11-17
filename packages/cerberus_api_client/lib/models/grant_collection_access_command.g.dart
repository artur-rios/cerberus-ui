// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_collection_access_command.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrantCollectionAccessCommand _$GrantCollectionAccessCommandFromJson(
  Map<String, dynamic> json,
) => GrantCollectionAccessCommand(
  grantId: json['grantId'] as String,
  recipientAccountId: json['recipientAccountId'] as String,
  expectedRevision: (json['expectedRevision'] as num?)?.toInt(),
  access: json['access'] as String?,
  keyEnvelope: RecipientEnvelope.fromJson(
    json['keyEnvelope'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$GrantCollectionAccessCommandToJson(
  GrantCollectionAccessCommand instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'recipientAccountId': instance.recipientAccountId,
  'expectedRevision': instance.expectedRevision,
  'access': instance.access,
  'keyEnvelope': instance.keyEnvelope,
};
