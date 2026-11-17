// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_list_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashListOutput _$TrashListOutputFromJson(Map<String, dynamic> json) =>
    TrashListOutput(
      items: (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                TrashListOutputItemsSealed.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      nextCursor: json['nextCursor'] as String?,
    );

Map<String, dynamic> _$TrashListOutputToJson(TrashListOutput instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextCursor': instance.nextCursor,
    };
