// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_closure_cancellation_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureCancellationOutput _$AccountClosureCancellationOutputFromJson(
  Map<String, dynamic> json,
) => AccountClosureCancellationOutput(
  accountId: json['accountId'] as String,
  revision: (json['revision'] as num).toInt(),
  revocationGeneration: (json['revocationGeneration'] as num).toInt(),
  cancelledAt: DateTime.parse(json['cancelledAt'] as String),
  serverTime: DateTime.parse(json['serverTime'] as String),
);

Map<String, dynamic> _$AccountClosureCancellationOutputToJson(
  AccountClosureCancellationOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'revision': instance.revision,
  'revocationGeneration': instance.revocationGeneration,
  'cancelledAt': instance.cancelledAt.toIso8601String(),
  'serverTime': instance.serverTime.toIso8601String(),
};
