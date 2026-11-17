// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_profile_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProfileOutputDataOutput$Request
_$DeleteProfileOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return DeleteProfileOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: DeleteProfileOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : DeleteProfileOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteProfileOutputDataOutput$RequestToJson(
  DeleteProfileOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?DeleteProfileOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
