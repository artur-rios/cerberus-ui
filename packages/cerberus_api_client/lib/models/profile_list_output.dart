// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'profile_list_item.dart';

part 'profile_list_output.g.dart';

@JsonSerializable()
class ProfileListOutput {
  const ProfileListOutput({this.items, this.nextCursor});

  factory ProfileListOutput.fromJson(Map<String, Object?> json) =>
      _$ProfileListOutputFromJson(json);

  final List<ProfileListItem>? items;
  final String? nextCursor;

  Map<String, Object?> toJson() => _$ProfileListOutputToJson(this);
}
