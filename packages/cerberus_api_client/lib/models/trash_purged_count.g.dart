// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_purged_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashPurgedCount _$TrashPurgedCountFromJson(Map<String, dynamic> json) =>
    TrashPurgedCount(
      kind: TrashPurgedCountKind.fromJson(json['kind'] as String),
      count: (json['count'] as num).toInt(),
    );

Map<String, dynamic> _$TrashPurgedCountToJson(TrashPurgedCount instance) =>
    <String, dynamic>{
      'kind': _$TrashPurgedCountKindEnumMap[instance.kind]!,
      'count': instance.count,
    };

const _$TrashPurgedCountKindEnumMap = {
  TrashPurgedCountKind.record: 'record',
  TrashPurgedCountKind.folder: 'folder',
  TrashPurgedCountKind.collection: 'collection',
  TrashPurgedCountKind.profile: 'profile',
  TrashPurgedCountKind.$unknown: r'$unknown',
};
