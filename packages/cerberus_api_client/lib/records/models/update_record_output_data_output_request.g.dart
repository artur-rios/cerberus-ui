// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_record_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRecordOutputDataOutput$Request
_$UpdateRecordOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return UpdateRecordOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: UpdateRecordOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : UpdateRecordOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateRecordOutputDataOutput$RequestToJson(
  UpdateRecordOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?UpdateRecordOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
