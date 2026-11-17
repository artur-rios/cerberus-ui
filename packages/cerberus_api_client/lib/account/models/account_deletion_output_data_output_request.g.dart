// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_deletion_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDeletionOutputDataOutput$Request
_$AccountDeletionOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return AccountDeletionOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: AccountDeletionOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : AccountDeletionOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountDeletionOutputDataOutput$RequestToJson(
  AccountDeletionOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?AccountDeletionOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
