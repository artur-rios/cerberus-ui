// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'recipient_envelope.dart';
import 'software_secret_resource.dart';

part 'software_secret_provisioning.g.dart';

@JsonSerializable()
class SoftwareSecretProvisioning {
  const SoftwareSecretProvisioning({
    required this.resource,
    required this.keyEnvelope,
  });

  factory SoftwareSecretProvisioning.fromJson(Map<String, Object?> json) =>
      _$SoftwareSecretProvisioningFromJson(json);

  final SoftwareSecretResource resource;
  final RecipientEnvelope keyEnvelope;

  Map<String, Object?> toJson() => _$SoftwareSecretProvisioningToJson(this);
}
