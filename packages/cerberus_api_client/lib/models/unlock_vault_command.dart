// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'unlock_vault_command.g.dart';

@JsonSerializable()
class UnlockVaultCommand {
  const UnlockVaultCommand({this.expectedProtectionRevision});

  factory UnlockVaultCommand.fromJson(Map<String, Object?> json) =>
      _$UnlockVaultCommandFromJson(json);

  final int? expectedProtectionRevision;

  Map<String, Object?> toJson() => _$UnlockVaultCommandToJson(this);
}
