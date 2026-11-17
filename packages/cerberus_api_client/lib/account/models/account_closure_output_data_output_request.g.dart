// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_closure_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureOutputDataOutput$Request
_$AccountClosureOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return AccountClosureOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: AccountClosureOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : AccountClosureOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountClosureOutputDataOutput$RequestToJson(
  AccountClosureOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?AccountClosureOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
