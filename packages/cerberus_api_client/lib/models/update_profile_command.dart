// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'update_profile_command.g.dart';

@JsonSerializable()
class UpdateProfileCommand {
  const UpdateProfileCommand({
    this.expectedRevision,
    this.envelope,
    this.editedAt,
  });

  factory UpdateProfileCommand.fromJson(Map<String, Object?> json) =>
      _$UpdateProfileCommandFromJson(json);

  final int? expectedRevision;
  final EncryptedEnvelope? envelope;
  final DateTime? editedAt;

  Map<String, Object?> toJson() => _$UpdateProfileCommandToJson(this);
}
