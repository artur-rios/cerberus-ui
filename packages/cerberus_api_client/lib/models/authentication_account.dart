// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'authentication_account.g.dart';

@JsonSerializable()
class AuthenticationAccount {
  const AuthenticationAccount({this.id, this.revision});

  factory AuthenticationAccount.fromJson(Map<String, Object?> json) =>
      _$AuthenticationAccountFromJson(json);

  final String? id;
  final int? revision;

  Map<String, Object?> toJson() => _$AuthenticationAccountToJson(this);
}
