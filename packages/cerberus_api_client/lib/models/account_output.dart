// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'account_output.g.dart';

@JsonSerializable()
class AccountOutput {
  const AccountOutput({
    required this.details,
    this.id,
    this.revision,
    this.state,
  });

  factory AccountOutput.fromJson(Map<String, Object?> json) =>
      _$AccountOutputFromJson(json);

  final String? id;
  final int? revision;
  final String? state;
  final EncryptedEnvelope details;

  Map<String, Object?> toJson() => _$AccountOutputToJson(this);
}
