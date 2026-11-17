// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_folder_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFolderOutputDataOutput$Response
_$MoveFolderOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return MoveFolderOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: MoveFolderOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : MoveFolderOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoveFolderOutputDataOutput$ResponseToJson(
  MoveFolderOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?MoveFolderOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
