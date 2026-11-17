// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trash_list_output_data_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrashListOutputDataOutput _$TrashListOutputDataOutputFromJson(
  Map<String, dynamic> json,
) => TrashListOutputDataOutput(
  messages: (json['messages'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  errors: (json['errors'] as List<dynamic>?)?.map((e) => e as String).toList(),
  timestamp: json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String),
  success: json['success'] as bool?,
  data: json['data'] == null
      ? null
      : TrashListOutput.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TrashListOutputDataOutputToJson(
  TrashListOutputDataOutput instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'errors': instance.errors,
  'timestamp': instance.timestamp?.toIso8601String(),
  'success': instance.success,
  'data': instance.data,
};
