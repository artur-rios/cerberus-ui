// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_edits_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncEditsOutput _$SyncEditsOutputFromJson(Map<String, dynamic> json) =>
    SyncEditsOutput(
      accountId: json['accountId'] as String?,
      profileId: json['profileId'] as String?,
      serverTime: json['serverTime'] == null
          ? null
          : DateTime.parse(json['serverTime'] as String),
      outcomes: (json['outcomes'] as List<dynamic>?)
          ?.map((e) => SyncEditOutcome.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SyncEditsOutputToJson(SyncEditsOutput instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'profileId': instance.profileId,
      'serverTime': instance.serverTime?.toIso8601String(),
      'outcomes': instance.outcomes,
    };
