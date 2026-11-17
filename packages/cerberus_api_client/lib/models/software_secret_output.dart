// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'public_jwk.dart';
import 'software_recipient_key.dart';
import 'software_secret_provisioning.dart';
import 'software_secret_resource.dart';

part 'software_secret_output.g.dart';

@JsonSerializable()
class SoftwareSecretOutput {
  const SoftwareSecretOutput({
    required this.ownerAccountId,
    required this.grantId,
    required this.grantRevision,
    required this.target,
    required this.provisioning,
    required this.recipientKey,
    required this.authorKey,
  });

  factory SoftwareSecretOutput.fromJson(Map<String, Object?> json) =>
      _$SoftwareSecretOutputFromJson(json);

  final String ownerAccountId;
  final String grantId;
  final int grantRevision;
  final SoftwareSecretResource target;
  final SoftwareSecretProvisioning provisioning;
  final SoftwareRecipientKey recipientKey;
  final PublicJwk authorKey;

  Map<String, Object?> toJson() => _$SoftwareSecretOutputToJson(this);
}
