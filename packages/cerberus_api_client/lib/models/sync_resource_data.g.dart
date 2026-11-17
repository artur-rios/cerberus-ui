// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_resource_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncResourceData _$SyncResourceDataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['resourceType', 'resourceId', 'revision'],
    requiredKeys: const ['resourceType'],
    disallowNullValues: const ['resourceType', 'resourceId', 'revision'],
  );
  return SyncResourceData(
    resourceType: json['resourceType'] as String,
    resourceId: json['resourceId'] as String?,
    revision: SyncResourceData._read_revision(json['revision']),
  );
}

Map<String, dynamic> _$SyncResourceDataToJson(SyncResourceData instance) =>
    <String, dynamic>{
      'resourceType': instance.resourceType,
      'resourceId': ?instance.resourceId,
      'revision': ?SyncResourceData._write_revision(instance.revision),
    };
