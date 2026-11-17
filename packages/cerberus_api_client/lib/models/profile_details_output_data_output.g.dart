// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_details_output_data_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDetailsOutputDataOutput _$ProfileDetailsOutputDataOutputFromJson(
  Map<String, dynamic> json,
) => ProfileDetailsOutputDataOutput(
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
      : ProfileDetailsOutput.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProfileDetailsOutputDataOutputToJson(
  ProfileDetailsOutputDataOutput instance,
) => <String, dynamic>{
  'messages': instance.messages,
  'errors': instance.errors,
  'timestamp': instance.timestamp?.toIso8601String(),
  'success': instance.success,
  'data': instance.data,
};
