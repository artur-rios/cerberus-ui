// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_edits_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncEditsOutputDataOutput$Response _$SyncEditsOutputDataOutput$ResponseFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return SyncEditsOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: SyncEditsOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : SyncEditsOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SyncEditsOutputDataOutput$ResponseToJson(
  SyncEditsOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?SyncEditsOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
