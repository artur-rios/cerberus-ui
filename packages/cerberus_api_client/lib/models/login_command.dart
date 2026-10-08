// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'login_command.g.dart';

@JsonSerializable()
class LoginCommand {
  const LoginCommand({this.email, this.password});

  factory LoginCommand.fromJson(Map<String, Object?> json) =>
      _$LoginCommandFromJson(json);

  final String? email;
  final String? password;

  Map<String, Object?> toJson() => _$LoginCommandToJson(this);
}
