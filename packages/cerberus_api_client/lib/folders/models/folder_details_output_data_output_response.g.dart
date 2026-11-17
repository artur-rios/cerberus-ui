// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_details_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderDetailsOutputDataOutput$Response
_$FolderDetailsOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return FolderDetailsOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: FolderDetailsOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : FolderDetailsOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FolderDetailsOutputDataOutput$ResponseToJson(
  FolderDetailsOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?FolderDetailsOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
