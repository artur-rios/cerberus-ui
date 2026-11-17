// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_purged_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashPurgedCount _$TrashPurgedCountFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['kind', 'count'],
    requiredKeys: const ['kind', 'count'],
    disallowNullValues: const ['kind', 'count'],
  );
  return TrashPurgedCount(
    kind: TrashPurgedCount._read_kind(json['kind']),
    count: TrashPurgedCount._read_count(json['count']),
  );
}

Map<String, dynamic> _$TrashPurgedCountToJson(TrashPurgedCount instance) =>
    <String, dynamic>{
      'kind': ?TrashPurgedCount._write_kind(instance.kind),
      'count': ?TrashPurgedCount._write_count(instance.count),
    };
