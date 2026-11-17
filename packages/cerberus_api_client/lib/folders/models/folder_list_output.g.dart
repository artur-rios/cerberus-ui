// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_list_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderListOutput _$FolderListOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(json, allowedKeys: const ['items', 'nextCursor']);
  return FolderListOutput(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => FolderListItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextCursor: json['nextCursor'] as String?,
  );
}

Map<String, dynamic> _$FolderListOutputToJson(FolderListOutput instance) =>
    <String, dynamic>{
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
      'nextCursor': ?instance.nextCursor,
    };
