// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'content_replacement.g.dart';

@JsonSerializable()
class ContentReplacement {
  const ContentReplacement({
    this.resourceKind,
    this.resourceId,
    this.expectedRevision,
    this.envelope,
  });

  factory ContentReplacement.fromJson(Map<String, Object?> json) =>
      _$ContentReplacementFromJson(json);

  final String? resourceKind;
  final String? resourceId;
  final int? expectedRevision;
  final EncryptedEnvelope? envelope;

  Map<String, Object?> toJson() => _$ContentReplacementToJson(this);
}
