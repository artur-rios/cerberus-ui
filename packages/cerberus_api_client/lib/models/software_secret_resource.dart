// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';

part 'software_secret_resource.g.dart';

@JsonSerializable()
class SoftwareSecretResource {
  const SoftwareSecretResource({
    required this.kind,
    required this.id,
    required this.revision,
    required this.keyEpoch,
    required this.envelope,
  });

  factory SoftwareSecretResource.fromJson(Map<String, Object?> json) =>
      _$SoftwareSecretResourceFromJson(json);

  final String? kind;
  final String id;
  final int revision;
  final int keyEpoch;
  final EncryptedEnvelope envelope;

  Map<String, Object?> toJson() => _$SoftwareSecretResourceToJson(this);
}
