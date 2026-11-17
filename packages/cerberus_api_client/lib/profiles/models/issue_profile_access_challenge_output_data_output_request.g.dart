// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_profile_access_challenge_output_data_output_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueProfileAccessChallengeOutputDataOutput$Request
_$IssueProfileAccessChallengeOutputDataOutput$RequestFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'data'],
    disallowNullValues: const ['timestamp', 'data'],
  );
  return IssueProfileAccessChallengeOutputDataOutput$Request(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp:
        IssueProfileAccessChallengeOutputDataOutput$Request._read_timestamp(
          json['timestamp'],
        ),
    data: json['data'] == null
        ? null
        : IssueProfileAccessChallengeOutput.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic>
_$IssueProfileAccessChallengeOutputDataOutput$RequestToJson(
  IssueProfileAccessChallengeOutputDataOutput$Request instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp':
      ?IssueProfileAccessChallengeOutputDataOutput$Request._write_timestamp(
        instance.timestamp,
      ),
  'data': ?instance.data?.toJson(),
};
