// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_changes_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncChangesOutput _$SyncChangesOutputFromJson(Map<String, dynamic> json) =>
    SyncChangesOutput(
      accountId: json['accountId'] as String?,
      profileId: json['profileId'] as String?,
      policyRevision: (json['policyRevision'] as num?)?.toInt(),
      revocationGeneration: (json['revocationGeneration'] as num?)?.toInt(),
      serverTime: json['serverTime'] == null
          ? null
          : DateTime.parse(json['serverTime'] as String),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => SyncChangeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['nextCursor'] as String?,
      hasMore: json['hasMore'] as bool?,
      clearScope: json['clearScope'] as bool?,
      resynchronizationRequired: json['resynchronizationRequired'] as bool?,
    );

Map<String, dynamic> _$SyncChangesOutputToJson(SyncChangesOutput instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'profileId': instance.profileId,
      'policyRevision': instance.policyRevision,
      'revocationGeneration': instance.revocationGeneration,
      'serverTime': instance.serverTime?.toIso8601String(),
      'items': instance.items,
      'nextCursor': instance.nextCursor,
      'hasMore': instance.hasMore,
      'clearScope': instance.clearScope,
      'resynchronizationRequired': instance.resynchronizationRequired,
    };
