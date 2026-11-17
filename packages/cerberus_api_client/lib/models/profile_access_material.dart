// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_import, invalid_annotation_target, unnecessary_import

import 'package:json_annotation/json_annotation.dart';

import 'encrypted_envelope.dart';
import 'profile_key_wrappers.dart';

part 'profile_access_material.g.dart';

@JsonSerializable()
class ProfileAccessMaterial {
  const ProfileAccessMaterial({
    this.accountId,
    this.profileId,
    this.revision,
    this.envelope,
    this.keyWrappers,
  });

  factory ProfileAccessMaterial.fromJson(Map<String, Object?> json) =>
      _$ProfileAccessMaterialFromJson(json);

  final String? accountId;
  final String? profileId;
  final int? revision;
  final EncryptedEnvelope? envelope;
  final ProfileKeyWrappers? keyWrappers;

  Map<String, Object?> toJson() => _$ProfileAccessMaterialToJson(this);
}
