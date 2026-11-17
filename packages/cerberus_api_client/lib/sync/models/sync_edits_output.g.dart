// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_edits_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncEditsOutput _$SyncEditsOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['accountId', 'profileId', 'serverTime', 'outcomes'],
    disallowNullValues: const ['accountId', 'serverTime'],
  );
  return SyncEditsOutput(
    accountId: json['accountId'] as String?,
    profileId: json['profileId'] as String?,
    serverTime: SyncEditsOutput._read_serverTime(json['serverTime']),
    outcomes: (json['outcomes'] as List<dynamic>?)
        ?.map((e) => SyncEditOutcome.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SyncEditsOutputToJson(SyncEditsOutput instance) =>
    <String, dynamic>{
      'accountId': ?instance.accountId,
      'profileId': ?instance.profileId,
      'serverTime': ?SyncEditsOutput._write_serverTime(instance.serverTime),
      'outcomes': ?instance.outcomes?.map((e) => e.toJson()).toList(),
    };
