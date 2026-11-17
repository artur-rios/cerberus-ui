// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_deletion_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountDeletionOutput _$AccountDeletionOutputFromJson(
  Map<String, dynamic> json,
) => AccountDeletionOutput(
  accountId: json['accountId'] as String,
  deletedAt: DateTime.parse(json['deletedAt'] as String),
  state: AccountDeletionOutputState.fromJson(json['state'] as String),
);

Map<String, dynamic> _$AccountDeletionOutputToJson(
  AccountDeletionOutput instance,
) => <String, dynamic>{
  'accountId': instance.accountId,
  'deletedAt': instance.deletedAt.toIso8601String(),
  'state': _$AccountDeletionOutputStateEnumMap[instance.state]!,
};

const _$AccountDeletionOutputStateEnumMap = {
  AccountDeletionOutputState.completed: 'completed',
  AccountDeletionOutputState.pending: 'pending',
  AccountDeletionOutputState.$unknown: r'$unknown',
};
