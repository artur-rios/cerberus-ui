// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_profile_associations_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetProfileAssociationsOutputDataOutput$Request
_$SetProfileAssociationsOutputDataOutput$RequestFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return SetProfileAssociationsOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: SetProfileAssociationsOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : SetProfileAssociationsOutput.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic> _$SetProfileAssociationsOutputDataOutput$RequestToJson(
  SetProfileAssociationsOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?SetProfileAssociationsOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
