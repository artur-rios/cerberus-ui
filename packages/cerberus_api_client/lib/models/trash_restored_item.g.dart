// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_restored_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashRestoredItem _$TrashRestoredItemFromJson(Map<String, dynamic> json) =>
    TrashRestoredItem(
      kind: json['kind'] as String?,
      resourceId: json['resourceId'] as String,
      revision: (json['revision'] as num).toInt(),
      serverSequence: (json['serverSequence'] as num).toInt(),
      editedAt: DateTime.parse(json['editedAt'] as String),
    );

Map<String, dynamic> _$TrashRestoredItemToJson(TrashRestoredItem instance) =>
    <String, dynamic>{
      'kind': instance.kind,
      'resourceId': instance.resourceId,
      'revision': instance.revision,
      'serverSequence': instance.serverSequence,
      'editedAt': instance.editedAt.toIso8601String(),
    };
