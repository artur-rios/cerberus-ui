// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offline_authorization_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfflineAuthorizationOutputDataOutput$Request
_$OfflineAuthorizationOutputDataOutput$RequestFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return OfflineAuthorizationOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: OfflineAuthorizationOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : OfflineAuthorizationOutput.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$OfflineAuthorizationOutputDataOutput$RequestToJson(
  OfflineAuthorizationOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?OfflineAuthorizationOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
