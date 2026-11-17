// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'folder_list_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FolderListOutputDataOutput$Request _$FolderListOutputDataOutput$RequestFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return FolderListOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: FolderListOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : FolderListOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FolderListOutputDataOutput$RequestToJson(
  FolderListOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?FolderListOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
