// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'authentication_account.dart';
import 'heimdall_login.dart';

part 'authentication_output.g.dart';

@JsonSerializable()
class AuthenticationOutput {
  const AuthenticationOutput({required this.identity, this.account});

  factory AuthenticationOutput.fromJson(Map<String, Object?> json) =>
      _$AuthenticationOutputFromJson(json);

  final HeimdallLogin identity;
  final AuthenticationAccount? account;

  Map<String, Object?> toJson() => _$AuthenticationOutputToJson(this);
}
