// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportCollection _$AccountExportCollectionFromJson(
  Map<String, dynamic> json,
) => AccountExportCollection(
  resourceId: json['resourceId'] as String,
  revision: (json['revision'] as num).toInt(),
  serverSequence: (json['serverSequence'] as num).toInt(),
  editedAt: DateTime.parse(json['editedAt'] as String),
  deletedAt: json['deletedAt'] == null
      ? null
      : DateTime.parse(json['deletedAt'] as String),
  purgeAt: json['purgeAt'] == null
      ? null
      : DateTime.parse(json['purgeAt'] as String),
  envelope: json['envelope'] as String?,
  keyEpoch: (json['keyEpoch'] as num).toInt(),
  entryType: AccountExportCollectionEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportCollectionToJson(
  AccountExportCollection instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
  'envelope': instance.envelope,
  'keyEpoch': instance.keyEpoch,
  'entryType': _$AccountExportCollectionEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportCollectionEntryTypeEnumMap = {
  AccountExportCollectionEntryType.collection: 'collection',
  AccountExportCollectionEntryType.$unknown: r'$unknown',
};
