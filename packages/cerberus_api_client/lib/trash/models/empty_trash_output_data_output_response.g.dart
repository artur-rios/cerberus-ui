// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_trash_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyTrashOutputDataOutput$Response
_$EmptyTrashOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return EmptyTrashOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: EmptyTrashOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : EmptyTrashOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EmptyTrashOutputDataOutput$ResponseToJson(
  EmptyTrashOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?EmptyTrashOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
