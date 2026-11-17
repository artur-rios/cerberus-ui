// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

part 'trash_restore_omission.g.dart';

@JsonSerializable()
class TrashRestoreOmission {
  const TrashRestoreOmission({
    required this.resourceKind,
    required this.resourceId,
    required this.associationKind,
    required this.count,
  });

  factory TrashRestoreOmission.fromJson(Map<String, Object?> json) =>
      _$TrashRestoreOmissionFromJson(json);

  final String? resourceKind;
  final String resourceId;
  final String? associationKind;
  final int count;

  Map<String, Object?> toJson() => _$TrashRestoreOmissionToJson(this);
}
