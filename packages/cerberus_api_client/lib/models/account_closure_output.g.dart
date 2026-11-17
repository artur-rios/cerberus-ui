// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_closure_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureOutput _$AccountClosureOutputFromJson(
  Map<String, dynamic> json,
) => AccountClosureOutput(
  accountId: json['accountId'] as String,
  revision: (json['revision'] as num).toInt(),
  revocationGeneration: (json['revocationGeneration'] as num).toInt(),
  closureRequestedAt: DateTime.parse(json['closureRequestedAt'] as String),
  closureDeadline: DateTime.parse(json['closureDeadline'] as String),
  serverTime: DateTime.parse(json['serverTime'] as String),
  alreadyPending: json['alreadyPending'] as bool,
);

Map<String, dynamic> _$AccountClosureOutputToJson(
  AccountClosureOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'revision': instance.revision,
  'revocationGeneration': instance.revocationGeneration,
  'closureRequestedAt': instance.closureRequestedAt.toIso8601String(),
  'closureDeadline': instance.closureDeadline.toIso8601String(),
  'serverTime': instance.serverTime.toIso8601String(),
  'alreadyPending': instance.alreadyPending,
};
