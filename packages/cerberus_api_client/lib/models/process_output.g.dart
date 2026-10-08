// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessOutput _$ProcessOutputFromJson(Map<String, dynamic> json) =>
    ProcessOutput(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      errors: (json['errors'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$ProcessOutputToJson(ProcessOutput instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'errors': instance.errors,
      'timestamp': instance.timestamp?.toIso8601String(),
      'success': instance.success,
    };
