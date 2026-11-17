// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_record_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRecordOutputDataOutput$Request
_$DeleteRecordOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return DeleteRecordOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: DeleteRecordOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : DeleteRecordOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteRecordOutputDataOutput$RequestToJson(
  DeleteRecordOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?DeleteRecordOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
