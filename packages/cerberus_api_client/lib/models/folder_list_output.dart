// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'folder_list_item.dart';

part 'folder_list_output.g.dart';

@JsonSerializable()
class FolderListOutput {
  const FolderListOutput({this.items, this.nextCursor});

  factory FolderListOutput.fromJson(Map<String, Object?> json) =>
      _$FolderListOutputFromJson(json);

  final List<FolderListItem>? items;
  final String? nextCursor;

  Map<String, Object?> toJson() => _$FolderListOutputToJson(this);
}
