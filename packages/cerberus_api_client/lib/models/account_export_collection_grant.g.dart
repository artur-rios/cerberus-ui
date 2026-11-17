// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_collection_grant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportCollectionGrant _$AccountExportCollectionGrantFromJson(
  Map<String, dynamic> json,
) => AccountExportCollectionGrant(
  grantId: json['grantId'] as String,
  collectionId: json['collectionId'] as String,
  recipientAccountId: json['recipientAccountId'] as String,
  access: AccountExportCollectionGrantAccess.fromJson(json['access'] as String),
  state: AccountExportCollectionGrantState.fromJson(json['state'] as String),
  revision: (json['revision'] as num).toInt(),
  recipientKeyEnvelope: json['recipientKeyEnvelope'] as String?,
  entryType: AccountExportCollectionGrantEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportCollectionGrantToJson(
  AccountExportCollectionGrant instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'collectionId': instance.collectionId,
  'recipientAccountId': instance.recipientAccountId,
  'access': _$AccountExportCollectionGrantAccessEnumMap[instance.access]!,
  'state': _$AccountExportCollectionGrantStateEnumMap[instance.state]!,
  'revision': instance.revision,
  'recipientKeyEnvelope': instance.recipientKeyEnvelope,
  'entryType':
      _$AccountExportCollectionGrantEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportCollectionGrantAccessEnumMap = {
  AccountExportCollectionGrantAccess.readOnly: 'read-only',
  AccountExportCollectionGrantAccess.readWrite: 'read-write',
  AccountExportCollectionGrantAccess.$unknown: r'$unknown',
};

const _$AccountExportCollectionGrantStateEnumMap = {
  AccountExportCollectionGrantState.active: 'active',
  AccountExportCollectionGrantState.revoked: 'revoked',
  AccountExportCollectionGrantState.$unknown: r'$unknown',
};

const _$AccountExportCollectionGrantEntryTypeEnumMap = {
  AccountExportCollectionGrantEntryType.collectionGrant: 'collection-grant',
  AccountExportCollectionGrantEntryType.$unknown: r'$unknown',
};
