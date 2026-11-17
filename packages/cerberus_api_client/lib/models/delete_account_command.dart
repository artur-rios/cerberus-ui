// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_account_command.g.dart';

@JsonSerializable()
class DeleteAccountCommand {
  const DeleteAccountCommand({required this.expectedRevision});

  factory DeleteAccountCommand.fromJson(Map<String, Object?> json) =>
      _$DeleteAccountCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$DeleteAccountCommandToJson(this);
}
