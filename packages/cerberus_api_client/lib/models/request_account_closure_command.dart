// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'request_account_closure_command.g.dart';

@JsonSerializable()
class RequestAccountClosureCommand {
  const RequestAccountClosureCommand({required this.expectedRevision});

  factory RequestAccountClosureCommand.fromJson(Map<String, Object?> json) =>
      _$RequestAccountClosureCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$RequestAccountClosureCommandToJson(this);
}
