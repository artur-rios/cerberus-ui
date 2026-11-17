// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_trash_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyTrashOutput _$EmptyTrashOutputFromJson(Map<String, dynamic> json) =>
    EmptyTrashOutput(
      accountId: json['accountId'] as String,
      purgedAt: DateTime.parse(json['purgedAt'] as String),
      counts: (json['counts'] as List<dynamic>)
          .map((e) => TrashPurgedCount.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPurged: (json['totalPurged'] as num).toInt(),
    );

Map<String, dynamic> _$EmptyTrashOutputToJson(EmptyTrashOutput instance) =>
    <String, dynamic>{
      'accountId': instance.accountId,
      'purgedAt': instance.purgedAt.toIso8601String(),
      'counts': instance.counts,
      'totalPurged': instance.totalPurged,
    };
