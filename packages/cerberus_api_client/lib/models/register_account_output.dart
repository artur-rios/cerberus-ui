// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'register_account_output.g.dart';

@JsonSerializable()
class RegisterAccountOutput {
  const RegisterAccountOutput({
    this.id,
    this.revision,
    this.onboardingState,
    this.replayed,
  });

  factory RegisterAccountOutput.fromJson(Map<String, Object?> json) =>
      _$RegisterAccountOutputFromJson(json);

  final String? id;
  final int? revision;
  final String? onboardingState;
  final bool? replayed;

  Map<String, Object?> toJson() => _$RegisterAccountOutputToJson(this);
}
