// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_record_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRecordOutputDataOutput$Response
_$DeleteRecordOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return DeleteRecordOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: DeleteRecordOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : DeleteRecordOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteRecordOutputDataOutput$ResponseToJson(
  DeleteRecordOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?DeleteRecordOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
