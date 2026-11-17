// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permanently_delete_record_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermanentlyDeleteRecordOutputDataOutput$Request
_$PermanentlyDeleteRecordOutputDataOutput$RequestFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return PermanentlyDeleteRecordOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: PermanentlyDeleteRecordOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : PermanentlyDeleteRecordOutput.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$PermanentlyDeleteRecordOutputDataOutput$RequestToJson(
  PermanentlyDeleteRecordOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp':
      ?PermanentlyDeleteRecordOutputDataOutput$Request._write_timestamp(
        instance.timestamp,
      ),
  'data': ?instance.data?.toJson(),
};
