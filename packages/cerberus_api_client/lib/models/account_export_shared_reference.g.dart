// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_shared_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportSharedReference _$AccountExportSharedReferenceFromJson(
  Map<String, dynamic> json,
) => AccountExportSharedReference(
  collectionId: json['collectionId'] as String,
  ownerAccountId: json['ownerAccountId'] as String,
  grantId: json['grantId'] as String,
  grantRevision: (json['grantRevision'] as num).toInt(),
  access: AccountExportSharedReferenceAccess.fromJson(json['access'] as String),
  entryType: AccountExportSharedReferenceEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportSharedReferenceToJson(
  AccountExportSharedReference instance,
) => <String, dynamic>{
  'collectionId': instance.collectionId,
  'ownerAccountId': instance.ownerAccountId,
  'grantId': instance.grantId,
  'grantRevision': instance.grantRevision,
  'access': _$AccountExportSharedReferenceAccessEnumMap[instance.access]!,
  'entryType':
      _$AccountExportSharedReferenceEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportSharedReferenceAccessEnumMap = {
  AccountExportSharedReferenceAccess.readOnly: 'read-only',
  AccountExportSharedReferenceAccess.readWrite: 'read-write',
  AccountExportSharedReferenceAccess.$unknown: r'$unknown',
};

const _$AccountExportSharedReferenceEntryTypeEnumMap = {
  AccountExportSharedReferenceEntryType.sharedCollectionReference:
      'shared-collection-reference',
  AccountExportSharedReferenceEntryType.$unknown: r'$unknown',
};
