// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_export_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountExportProfile _$AccountExportProfileFromJson(
  Map<String, dynamic> json,
) => AccountExportProfile(
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
  keyWrappers: json['keyWrappers'] as String?,
  entryType: AccountExportProfileEntryType.fromJson(
    json['entryType'] as String,
  ),
);

Map<String, dynamic> _$AccountExportProfileToJson(
  AccountExportProfile instance,
) => <String, dynamic>{
  'resourceId': instance.resourceId,
  'revision': instance.revision,
  'serverSequence': instance.serverSequence,
  'editedAt': instance.editedAt.toIso8601String(),
  'deletedAt': instance.deletedAt?.toIso8601String(),
  'purgeAt': instance.purgeAt?.toIso8601String(),
  'envelope': instance.envelope,
  'keyWrappers': instance.keyWrappers,
  'entryType': _$AccountExportProfileEntryTypeEnumMap[instance.entryType]!,
};

const _$AccountExportProfileEntryTypeEnumMap = {
  AccountExportProfileEntryType.profile: 'profile',
  AccountExportProfileEntryType.$unknown: r'$unknown',
};
