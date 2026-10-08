// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'heimdall_registration.dart';

part 'register_account_command.g.dart';

@JsonSerializable()
class RegisterAccountCommand {
  const RegisterAccountCommand({
    this.accountId,
    this.idempotencyKey,
    this.identity,
    this.details,
  });

  factory RegisterAccountCommand.fromJson(Map<String, Object?> json) =>
      _$RegisterAccountCommandFromJson(json);

  final String? accountId;
  final String? idempotencyKey;
  final HeimdallRegistration? identity;
  final EncryptedEnvelope? details;

  Map<String, Object?> toJson() => _$RegisterAccountCommandToJson(this);
}
