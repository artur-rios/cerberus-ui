// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'recipient_envelope.dart';

part 'software_grant_target_input.g.dart';

@JsonSerializable()
class SoftwareGrantTargetInput {
  const SoftwareGrantTargetInput({
    required this.kind,
    required this.id,
    required this.keyEnvelope,
  });

  factory SoftwareGrantTargetInput.fromJson(Map<String, Object?> json) =>
      _$SoftwareGrantTargetInputFromJson(json);

  final String? kind;
  final String id;
  final RecipientEnvelope keyEnvelope;

  Map<String, Object?> toJson() => _$SoftwareGrantTargetInputToJson(this);
}
