// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_list_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordListOutput _$RecordListOutputFromJson(Map<String, dynamic> json) =>
    RecordListOutput(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => RecordListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['nextCursor'] as String?,
    );

Map<String, dynamic> _$RecordListOutputToJson(RecordListOutput instance) =>
    <String, dynamic>{
      'items': instance.items,
      'nextCursor': instance.nextCursor,
    };
