// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_list_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashListOutput _$TrashListOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['items', 'nextCursor'],
    requiredKeys: const ['items', 'nextCursor'],
  );
  return TrashListOutput(
    items: TrashListOutput._read_items(json['items']),
    nextCursor: json['nextCursor'] as String?,
  );
}

Map<String, dynamic> _$TrashListOutputToJson(TrashListOutput instance) =>
    <String, dynamic>{
      'items': TrashListOutput._write_items(instance.items),
      'nextCursor': instance.nextCursor,
    };
