// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_trash_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyTrashOutput _$EmptyTrashOutputFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['accountId', 'purgedAt', 'counts', 'totalPurged'],
    requiredKeys: const ['accountId', 'purgedAt', 'counts', 'totalPurged'],
    disallowNullValues: const [
      'accountId',
      'purgedAt',
      'counts',
      'totalPurged',
    ],
  );
  return EmptyTrashOutput(
    accountId: json['accountId'] as String,
    purgedAt: EmptyTrashOutput._read_purgedAt(json['purgedAt']),
    counts: (json['counts'] as List<dynamic>)
        .map((e) => TrashPurgedCount.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPurged: EmptyTrashOutput._read_totalPurged(json['totalPurged']),
  );
}

Map<String, dynamic> _$EmptyTrashOutputToJson(EmptyTrashOutput instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'purgedAt': ?EmptyTrashOutput._write_purgedAt(instance.purgedAt),
      'counts': instance.counts.map((e) => e.toJson()).toList(),
      'totalPurged': ?EmptyTrashOutput._write_totalPurged(instance.totalPurged),
    };
