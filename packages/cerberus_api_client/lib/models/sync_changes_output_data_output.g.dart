// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_changes_output_data_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncChangesOutputDataOutput _$SyncChangesOutputDataOutputFromJson(
  Map<String, dynamic> json,
) => SyncChangesOutputDataOutput(
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
      : SyncChangesOutput.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SyncChangesOutputDataOutputToJson(
  SyncChangesOutputDataOutput instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'errors': instance.errors,
  'timestamp': instance.timestamp?.toIso8601String(),
  'success': instance.success,
  'data': instance.data,
};
