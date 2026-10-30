// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'update_account_command.g.dart';

@JsonSerializable()
class UpdateAccountCommand {
  const UpdateAccountCommand({this.expectedRevision, this.details});

  factory UpdateAccountCommand.fromJson(Map<String, Object?> json) =>
      _$UpdateAccountCommandFromJson(json);

  final int? expectedRevision;
  final EncryptedEnvelope? details;

  Map<String, Object?> toJson() => _$UpdateAccountCommandToJson(this);
}
