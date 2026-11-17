// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_changes_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncChangesOutputDataOutput$Request
_$SyncChangesOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return SyncChangesOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: SyncChangesOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : SyncChangesOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SyncChangesOutputDataOutput$RequestToJson(
  SyncChangesOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?SyncChangesOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
