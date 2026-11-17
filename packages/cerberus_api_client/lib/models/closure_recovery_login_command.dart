// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'closure_recovery_login_command.g.dart';

@JsonSerializable()
class ClosureRecoveryLoginCommand {
  const ClosureRecoveryLoginCommand({
    required this.email,
    required this.password,
  });

  factory ClosureRecoveryLoginCommand.fromJson(Map<String, Object?> json) =>
      _$ClosureRecoveryLoginCommandFromJson(json);

  final String? email;
  final String? password;

  Map<String, Object?> toJson() => _$ClosureRecoveryLoginCommandToJson(this);
}
