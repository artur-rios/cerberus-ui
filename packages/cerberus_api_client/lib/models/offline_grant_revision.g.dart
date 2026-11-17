// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_grant_revision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflineGrantRevision _$OfflineGrantRevisionFromJson(
  Map<String, dynamic> json,
) => OfflineGrantRevision(
  grantId: json['grantId'] as String?,
  revision: (json['revision'] as num?)?.toInt(),
);

Map<String, dynamic> _$OfflineGrantRevisionToJson(
  OfflineGrantRevision instance,
) => <String, dynamic>{
  'grantId': instance.grantId,
  'revision': instance.revision,
};
