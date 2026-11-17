// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_profile_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteProfileOutputDataOutput$Response
_$DeleteProfileOutputDataOutput$ResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return DeleteProfileOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: DeleteProfileOutputDataOutput$Response._read_timestamp(
      json['timestamp'],
    ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : DeleteProfileOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DeleteProfileOutputDataOutput$ResponseToJson(
  DeleteProfileOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?DeleteProfileOutputDataOutput$Response._write_timestamp(
    instance.timestamp,
  ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
