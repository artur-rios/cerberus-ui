// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_list_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionListOutput _$CollectionListOutputFromJson(
  Map<String, dynamic> json,
) => CollectionListOutput(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => CollectionListItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextCursor: json['nextCursor'] as String?,
);

Map<String, dynamic> _$CollectionListOutputToJson(
  CollectionListOutput instance,
) => <String, dynamic>{
  'items': instance.items,
  'nextCursor': instance.nextCursor,
};
