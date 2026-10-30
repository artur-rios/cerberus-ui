// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'update_identity_command.g.dart';

@JsonSerializable()
class UpdateIdentityCommand {
  const UpdateIdentityCommand({this.name, this.email});

  factory UpdateIdentityCommand.fromJson(Map<String, Object?> json) =>
      _$UpdateIdentityCommandFromJson(json);

  final String? name;
  final String? email;

  Map<String, Object?> toJson() => _$UpdateIdentityCommandToJson(this);
}
