// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_list_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderListOutputDataOutput$Response
_$FolderListOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return FolderListOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: FolderListOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : FolderListOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FolderListOutputDataOutput$ResponseToJson(
  FolderListOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?FolderListOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
