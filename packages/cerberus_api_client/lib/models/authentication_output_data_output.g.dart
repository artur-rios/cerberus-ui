// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_output_data_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationOutputDataOutput _$AuthenticationOutputDataOutputFromJson(
  Map<String, dynamic> json,
) => AuthenticationOutputDataOutput(
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
      : AuthenticationOutput.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthenticationOutputDataOutputToJson(
  AuthenticationOutputDataOutput instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'errors': instance.errors,
  'timestamp': instance.timestamp?.toIso8601String(),
  'success': instance.success,
  'data': instance.data,
};
