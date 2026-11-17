// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'account_deletion_output_state.dart';

part 'account_deletion_output.g.dart';

@JsonSerializable()
class AccountDeletionOutput {
  const AccountDeletionOutput({
    required this.accountId,
    required this.deletedAt,
    required this.state,
  });

  factory AccountDeletionOutput.fromJson(Map<String, Object?> json) =>
      _$AccountDeletionOutputFromJson(json);

  final String accountId;
  final DateTime deletedAt;
  final AccountDeletionOutputState state;

  Map<String, Object?> toJson() => _$AccountDeletionOutputToJson(this);
}
