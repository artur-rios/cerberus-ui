// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_change_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncChangeItem _$SyncChangeItemFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'sequence',
      'resourceKind',
      'resourceId',
      'eventType',
      'data',
      'deletedAt',
    ],
    disallowNullValues: const ['sequence', 'resourceId'],
  );
  return SyncChangeItem(
    sequence: SyncChangeItem._read_sequence(json['sequence']),
    resourceKind: json['resourceKind'] as String?,
    resourceId: json['resourceId'] as String?,
    eventType: json['eventType'] as String?,
    data: !json.containsKey('data')
        ? null
        : SyncChangeItem._read_data(json['data']),
    deletedAt: SyncChangeItem._read_deletedAt(json['deletedAt']),
  );
}

Map<String, dynamic> _$SyncChangeItemToJson(SyncChangeItem instance) =>
    <String, dynamic>{
      'sequence': ?SyncChangeItem._write_sequence(instance.sequence),
      'resourceKind': ?instance.resourceKind,
      'resourceId': ?instance.resourceId,
      'eventType': ?instance.eventType,
      if (instance.data case final $value?)
        'data': SyncChangeItem._write_data($value),
      'deletedAt': ?SyncChangeItem._write_deletedAt(instance.deletedAt),
    };
