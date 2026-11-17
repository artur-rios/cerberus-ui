// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_change_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncChangeItem _$SyncChangeItemFromJson(Map<String, dynamic> json) =>
    SyncChangeItem(
      sequence: (json['sequence'] as num?)?.toInt(),
      resourceKind: json['resourceKind'] as String?,
      resourceId: json['resourceId'] as String?,
      eventType: json['eventType'] as String?,
      data: json['data'] == null
          ? null
          : SyncChangeItemDataSealed.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$SyncChangeItemToJson(SyncChangeItem instance) =>
    <String, dynamic>{
      'sequence': instance.sequence,
      'resourceKind': instance.resourceKind,
      'resourceId': instance.resourceId,
      'eventType': instance.eventType,
      'data': instance.data,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
