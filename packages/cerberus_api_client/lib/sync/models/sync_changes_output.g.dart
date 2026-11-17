// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_changes_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SyncChangesOutput _$SyncChangesOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'accountId',
      'profileId',
      'policyRevision',
      'revocationGeneration',
      'serverTime',
      'items',
      'nextCursor',
      'hasMore',
      'clearScope',
      'resynchronizationRequired',
    ],
    disallowNullValues: const [
      'accountId',
      'profileId',
      'policyRevision',
      'revocationGeneration',
      'serverTime',
      'hasMore',
      'clearScope',
      'resynchronizationRequired',
    ],
  );
  return SyncChangesOutput(
    accountId: json['accountId'] as String?,
    profileId: json['profileId'] as String?,
    policyRevision: SyncChangesOutput._read_policyRevision(
      json['policyRevision'],
    ),
    revocationGeneration: SyncChangesOutput._read_revocationGeneration(
      json['revocationGeneration'],
    ),
    serverTime: SyncChangesOutput._read_serverTime(json['serverTime']),
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => SyncChangeItem.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextCursor: json['nextCursor'] as String?,
    hasMore: json['hasMore'] as bool?,
    clearScope: json['clearScope'] as bool?,
    resynchronizationRequired: json['resynchronizationRequired'] as bool?,
  );
}

Map<String, dynamic> _$SyncChangesOutputToJson(SyncChangesOutput instance) =>
    <String, dynamic>{
      'accountId': ?instance.accountId,
      'profileId': ?instance.profileId,
      'policyRevision': ?SyncChangesOutput._write_policyRevision(
        instance.policyRevision,
      ),
      'revocationGeneration': ?SyncChangesOutput._write_revocationGeneration(
        instance.revocationGeneration,
      ),
      'serverTime': ?SyncChangesOutput._write_serverTime(instance.serverTime),
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
      'nextCursor': ?instance.nextCursor,
      'hasMore': ?instance.hasMore,
      'clearScope': ?instance.clearScope,
      'resynchronizationRequired': ?instance.resynchronizationRequired,
    };
