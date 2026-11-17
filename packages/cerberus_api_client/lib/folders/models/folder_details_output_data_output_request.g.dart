// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_details_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderDetailsOutputDataOutput$Request
_$FolderDetailsOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return FolderDetailsOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: FolderDetailsOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : FolderDetailsOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FolderDetailsOutputDataOutput$RequestToJson(
  FolderDetailsOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?FolderDetailsOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
