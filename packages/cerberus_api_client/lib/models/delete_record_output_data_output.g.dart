// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_record_output_data_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRecordOutputDataOutput _$DeleteRecordOutputDataOutputFromJson(
  Map<String, dynamic> json,
) => DeleteRecordOutputDataOutput(
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
      : DeleteRecordOutput.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeleteRecordOutputDataOutputToJson(
  DeleteRecordOutputDataOutput instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'errors': instance.errors,
  'timestamp': instance.timestamp?.toIso8601String(),
  'success': instance.success,
  'data': instance.data,
};
