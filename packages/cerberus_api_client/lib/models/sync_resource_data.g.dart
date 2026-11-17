// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_resource_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncResourceData _$SyncResourceDataFromJson(Map<String, dynamic> json) =>
    SyncResourceData(
      resourceType: json['resourceType'] as String,
      resourceId: json['resourceId'] as String?,
      revision: (json['revision'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SyncResourceDataToJson(SyncResourceData instance) =>
    <String, dynamic>{
      'resourceType': instance.resourceType,
      'resourceId': instance.resourceId,
      'revision': instance.revision,
    };
