// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_challenge_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VaultChallengeOutputDataOutput$Request
_$VaultChallengeOutputDataOutput$RequestFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return VaultChallengeOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp: VaultChallengeOutputDataOutput$Request._read_timestamp(
      json['timestamp'],
    ),
    data: json['data'] == null
        ? null
        : VaultChallengeOutput.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VaultChallengeOutputDataOutput$RequestToJson(
  VaultChallengeOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp': ?VaultChallengeOutputDataOutput$Request._write_timestamp(
    instance.timestamp,
  ),
  'data': ?instance.data?.toJson(),
};
