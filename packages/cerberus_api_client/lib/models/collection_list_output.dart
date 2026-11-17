// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'collection_list_item.dart';

part 'collection_list_output.g.dart';

@JsonSerializable()
class CollectionListOutput {
  const CollectionListOutput({this.items, this.nextCursor});

  factory CollectionListOutput.fromJson(Map<String, Object?> json) =>
      _$CollectionListOutputFromJson(json);

  final List<CollectionListItem>? items;
  final String? nextCursor;

  Map<String, Object?> toJson() => _$CollectionListOutputToJson(this);
}
