// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'delete_collection_command.g.dart';

@JsonSerializable()
class DeleteCollectionCommand {
  const DeleteCollectionCommand({required this.expectedRevision});

  factory DeleteCollectionCommand.fromJson(Map<String, Object?> json) =>
      _$DeleteCollectionCommandFromJson(json);

  final int expectedRevision;

  Map<String, Object?> toJson() => _$DeleteCollectionCommandToJson(this);
}
