// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_grant_revision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflineGrantRevision _$OfflineGrantRevisionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['grantId', 'revision'],
    disallowNullValues: const ['grantId', 'revision'],
  );
  return OfflineGrantRevision(
    grantId: json['grantId'] as String?,
    revision: OfflineGrantRevision._read_revision(json['revision']),
  );
}

Map<String, dynamic> _$OfflineGrantRevisionToJson(
  OfflineGrantRevision instance,
) => <String, dynamic>{
  'grantId': ?instance.grantId,
  'revision': ?OfflineGrantRevision._write_revision(instance.revision),
};
