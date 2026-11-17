// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_trash_output_data_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyTrashOutputDataOutput _$EmptyTrashOutputDataOutputFromJson(
  Map<String, dynamic> json,
) => EmptyTrashOutputDataOutput(
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
      : EmptyTrashOutput.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$EmptyTrashOutputDataOutputToJson(
  EmptyTrashOutputDataOutput instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'errors': instance.errors,
  'timestamp': instance.timestamp?.toIso8601String(),
  'success': instance.success,
  'data': instance.data,
};
