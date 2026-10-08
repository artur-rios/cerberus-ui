// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'update_account_output.g.dart';

@JsonSerializable()
class UpdateAccountOutput {
  const UpdateAccountOutput({this.id, this.revision});

  factory UpdateAccountOutput.fromJson(Map<String, Object?> json) =>
      _$UpdateAccountOutputFromJson(json);

  final String? id;
  final int? revision;

  Map<String, Object?> toJson() => _$UpdateAccountOutputToJson(this);
}
