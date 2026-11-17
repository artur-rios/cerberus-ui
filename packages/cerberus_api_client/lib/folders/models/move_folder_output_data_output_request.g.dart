// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'move_folder_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoveFolderOutputDataOutput$Request _$MoveFolderOutputDataOutput$RequestFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return MoveFolderOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: MoveFolderOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : MoveFolderOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MoveFolderOutputDataOutput$RequestToJson(
  MoveFolderOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?MoveFolderOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
