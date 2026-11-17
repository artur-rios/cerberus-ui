// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_record_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveRecordOutputDataOutput$Response
_$MoveRecordOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return MoveRecordOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: MoveRecordOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : MoveRecordOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoveRecordOutputDataOutput$ResponseToJson(
  MoveRecordOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?MoveRecordOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
