// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_software_access_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GrantSoftwareAccessOutputDataOutput$Request
_$GrantSoftwareAccessOutputDataOutput$RequestFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return GrantSoftwareAccessOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: GrantSoftwareAccessOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : GrantSoftwareAccessOutput.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$GrantSoftwareAccessOutputDataOutput$RequestToJson(
  GrantSoftwareAccessOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?GrantSoftwareAccessOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
