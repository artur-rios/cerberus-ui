// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_closure_recovery_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountClosureRecoveryDetails _$AccountClosureRecoveryDetailsFromJson(
  Map<String, dynamic> json,
) => AccountClosureRecoveryDetails(
  accountId: json['accountId'] as String,
  revision: (json['revision'] as num).toInt(),
  closureDeadline: DateTime.parse(json['closureDeadline'] as String),
  serverTime: DateTime.parse(json['serverTime'] as String),
);

Map<String, dynamic> _$AccountClosureRecoveryDetailsToJson(
  AccountClosureRecoveryDetails instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'revision': instance.revision,
  'closureDeadline': instance.closureDeadline.toIso8601String(),
  'serverTime': instance.serverTime.toIso8601String(),
};
