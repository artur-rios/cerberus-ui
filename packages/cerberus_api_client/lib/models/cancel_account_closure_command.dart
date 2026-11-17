// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'cancel_account_closure_command.g.dart';

@JsonSerializable()
class CancelAccountClosureCommand {
  const CancelAccountClosureCommand({required this.expectedRevision});

  factory CancelAccountClosureCommand.fromJson(Map<String, Object?> json) =>
      _$CancelAccountClosureCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$CancelAccountClosureCommandToJson(this);
}
