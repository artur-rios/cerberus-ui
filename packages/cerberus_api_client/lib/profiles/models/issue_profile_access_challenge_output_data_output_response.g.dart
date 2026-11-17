// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_profile_access_challenge_output_data_output_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueProfileAccessChallengeOutputDataOutput$Response
_$IssueProfileAccessChallengeOutputDataOutput$ResponseFromJson(
  Map<String, dynamic> json,
) {
  $checkKeys(
    json,
    allowedKeys: const ['messages', 'errors', 'timestamp', 'success', 'data'],
    disallowNullValues: const ['timestamp', 'success', 'data'],
  );
  return IssueProfileAccessChallengeOutputDataOutput$Response(
    messages: (json['messages'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    errors: (json['errors'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    timestamp:
        IssueProfileAccessChallengeOutputDataOutput$Response._read_timestamp(
          json['timestamp'],
        ),
    success: json['success'] as bool?,
    data: json['data'] == null
        ? null
        : IssueProfileAccessChallengeOutput.fromJson(
            json['data'] as Map<String, dynamic>,
          ),
  );
}

Map<String, dynamic>
_$IssueProfileAccessChallengeOutputDataOutput$ResponseToJson(
  IssueProfileAccessChallengeOutputDataOutput$Response instance,
) => <String, dynamic>{
  'messages': ?instance.messages,
  'errors': ?instance.errors,
  'timestamp':
      ?IssueProfileAccessChallengeOutputDataOutput$Response._write_timestamp(
        instance.timestamp,
      ),
  'success': ?instance.success,
  'data': ?instance.data?.toJson(),
};
